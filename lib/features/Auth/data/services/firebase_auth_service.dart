import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';


class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
     clientId:
      '969525770235-q1fbh1e583geai9tlkhc72kcojgoo8rn.apps.googleusercontent.com',
  );

    Future<User> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {

      throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }


  Future<User> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }


  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

   if (googleUser == null) {
  throw CustomException(
    message: "تم إلغاء تسجيل الدخول بواسطة Google",
  );
}

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);

    return userCredential.user!;
  }

Future<User> signInWithFacebook() async {
  final LoginResult loginResult =
      await FacebookAuth.instance.login();

  if (loginResult.status != LoginStatus.success) {
    throw Exception("Facebook sign in failed");
  }

  final OAuthCredential facebookCredential =
      FacebookAuthProvider.credential(
    loginResult.accessToken!.token,
  );

  final userCredential =
      await _auth.signInWithCredential(facebookCredential);

  return userCredential.user!;
}

//
String _generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(
      length, (_) => charset[random.nextInt(charset.length)]).join();
}

String _sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

// Future<User> signInWithApple() async {
//   final rawNonce = _generateNonce();
//   final nonce = _sha256ofString(rawNonce);

//   final appleCredential =
//       await SignInWithApple.getAppleIDCredential(
//     scopes: [
//       AppleIDAuthorizationScopes.email,
//       AppleIDAuthorizationScopes.fullName,
//     ],
//     nonce: nonce,
//   );

//   final oauthCredential =
//       OAuthProvider("apple.com").credential(
//     idToken: appleCredential.identityToken,
//     rawNonce: rawNonce,
//   );

//   final userCredential =
//       await _auth.signInWithCredential(oauthCredential);

//   return userCredential.user!;
// }





  Future<void> signOut() async {
    await _googleSignIn.signOut(); // مهم جدًا
    await _auth.signOut();
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
      }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }

}

Future<String> verifyPhoneNumber({
  required String phoneNumber,
}) async {
  final completer = Completer<String>();

  await _auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,

    verificationCompleted: (credential) async {
      await _auth.signInWithCredential(credential);
    },

    verificationFailed: (FirebaseAuthException e) {
      completer.completeError(
        CustomException(
          message: e.message ?? "فشل التحقق من رقم الهاتف",
        ),
      );
    },

    codeSent: (verificationId, resendToken) {
      completer.complete(verificationId);
    },

    codeAutoRetrievalTimeout: (verificationId) {},
  );

  return completer.future;
}



Future<void> updatePassword(String newPassword) async {
  try {
    await _auth.currentUser!.updatePassword(newPassword);
  } on FirebaseAuthException catch (e) {
    throw CustomException(
      message: e.message ?? "فشل تحديث كلمة المرور",
    );
  } catch (_) {
    throw CustomException(
      message: "حدث خطأ غير متوقع",
    );
  }
}


Future<void> verifyOtp({
  required String verificationId,
  required String smsCode,
}) async {
  try {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await _auth.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    throw CustomException(
      message: e.message ?? "كود التحقق غير صحيح",
    );
  } catch (_) {
    throw CustomException(
      message: "حدث خطأ أثناء التحقق من الكود",
    );
  }
}
}
