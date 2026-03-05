

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });

 Future<Either<Failure, UserEntity>>signInwithEmailAndPassword({
    required String email,
    required String password,
  });

 Future<Either<Failure, UserEntity>> signInWithGoogle();
 Future<Either<Failure, UserEntity>>signInWithFacebook();

 Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> sendPasswordResetEmail(String email);

  Future<Either<Failure, String>> verifyPhoneNumber(String phone);

Future<Either<Failure, void>> verifyOtp({
  required String verificationId,
  required String smsCode,
});

Future<Either<Failure, void>> updatePassword(String newPassword);

 bool isLoggedIn();
UserEntity? getCurrentUser();

 Future addDataUser({required UserEntity user});
 Future deletUser();

  Future<UserEntity> getUserData({required String uid});
}