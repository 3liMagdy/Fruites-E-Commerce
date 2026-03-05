import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endPoint.dart';
import 'package:fruits_hub/features/Auth/data/user_model.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataService dataService; 

  AuthRepoImpl(this.firebaseAuthService, {required this.dataService});

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {

    User? firebaseUser;
    
    try {
       firebaseUser = await firebaseAuthService
          .createUserWithEmailAndPassword(email: email, password: password);
       UserEntity userEntity=UserModel.fromFirebase(firebaseUser);
      await firebaseUser.updateDisplayName(name);
       await addDataUser(user:UserEntity(id: userEntity.id, email: email, name: name));
     
      return right(userEntity);
    } catch (e) {
       if (firebaseUser != null) {
        deletUser();
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInwithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity =await getUserData(uid: firebaseUser.uid);
      
      return right(userEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  // Future<UserEntity> signInWithApple() async {
  //   final firebaseUser =
  //       await firebaseAuthService.signInWithApple();
  //   return UserModel.fromFirebase(firebaseUser);
  // }
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
      User? firebaseUser;
    try {
       firebaseUser = await firebaseAuthService.signInWithFacebook();
        UserEntity userEntity=UserModel.fromFirebase(firebaseUser);
         await addDataUser(user: userEntity);
      return right(userEntity);
    } catch (e) {
      if (firebaseUser != null) {
        deletUser();
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {

    User? firebaseUser;
    try {
        firebaseUser = await firebaseAuthService.signInWithGoogle();
     UserEntity userEntity=UserModel.fromFirebase(firebaseUser);
  var isUserExists= await dataService.checkIfDataExists(path:BackendEndPoint.isCheckUserExists, document_id: firebaseUser.uid);
     if(isUserExists){
     await getUserData(uid: firebaseUser.uid);
     }else{
       await addDataUser(user: userEntity);
     }
     

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
        if (firebaseUser != null) {
        deletUser();
      }
      return left(ServerFailure("حدث خطأ غير متوقع"));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await firebaseAuthService.signOut();
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  bool isLoggedIn() {
    return firebaseAuthService.isLoggedIn();
  }

  @override
  UserEntity? getCurrentUser() {
    final user = firebaseAuthService.getCurrentUser();
    if (user == null) return null;
    return UserModel.fromFirebase(user);
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuthService.sendPasswordResetEmail(email);
      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure("حدث خطأ غير متوقع"));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(String newPassword) async {
    try {
      await firebaseAuthService.updatePassword(newPassword);
      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (_) {
      return left(ServerFailure("فشل تحديث كلمة المرور"));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      await firebaseAuthService.verifyOtp(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (_) {
      return left(ServerFailure("كود التحقق غير صحيح"));
    }
  }

  @override
  Future<Either<Failure, String>> verifyPhoneNumber(String phone) async {
    try {
      final verificationId = await firebaseAuthService.verifyPhoneNumber(
        phoneNumber: phone,
      );

      return right(verificationId);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure("حدث خطأ أثناء إرسال الكود"));
    }
  }
  
  @override
  Future<dynamic> addDataUser({required UserEntity user})async {
   
   await dataService.addData(path:BackendEndPoint.addUserData, data: user.tomap(),documentId: user.id);
  }
  
  @override
  Future deletUser() async{
     await firebaseAuthService.deletUser();
  }
  
  @override
  Future<UserEntity> getUserData({required String uid}) async{
    var data =await dataService.getData(path: BackendEndPoint.getUserData, document_id: uid);
    return  UserModel.fromJson(data);
  }
}
