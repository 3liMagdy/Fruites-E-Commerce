

import 'package:fruits_hub/features/Auth/data/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/Auth/data/user_model.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);

  @override
  Future<UserEntity> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final firebaseUser =
        await firebaseAuthService.createUser(
      email: email,
      password: password,
    );

    await firebaseUser.updateDisplayName(name);

    return UserModel.fromFirebase(firebaseUser);
  }
  
  @override
  Future<UserEntity> signInwithEmailAndPassword({required String email, required String password})async {
      final firebaseUser =
        await firebaseAuthService.signInwithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(firebaseUser!);
  }

  @override
Future<UserEntity> signInWithApple() async {
  final firebaseUser =
      await firebaseAuthService.signInWithApple();

  return UserModel.fromFirebase(firebaseUser);
}

@override
Future<UserEntity> signInWithFacebook() async {
  final firebaseUser =
      await firebaseAuthService.signInWithFacebook();

  return UserModel.fromFirebase(firebaseUser);
}


  @override
Future<UserEntity> signInWithGoogle() async {
  final firebaseUser =
      await firebaseAuthService.signInWithGoogle();

  return UserModel.fromFirebase(firebaseUser);
}
  
  @override
  Future<void> signOut() async{
    await firebaseAuthService.signOut();
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
}