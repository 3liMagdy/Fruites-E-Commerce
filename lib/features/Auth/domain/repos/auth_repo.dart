

import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserEntity> signInwithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signInWithFacebook();
  Future<UserEntity> signInWithApple();
 Future<void> signOut();

 bool isLoggedIn();
UserEntity? getCurrentUser();
}