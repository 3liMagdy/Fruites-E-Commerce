import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/app_cubit/app_cubit.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo, this.appCubit) : super(AuthInitial());

  final AuthRepo authRepo;
  final AppCubit appCubit;
  String? _verificationId;

  // =========================
  // Sign Up
  // =========================
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());

    final result = await authRepo.signUp(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (Failure failure) {
        emit(AuthFuiledState(failure.errMessage));
      },
      (UserEntity user) {
        appCubit.setAuthenticated(user);
        emit(AuthSuccessState(user));
      },
    );
  }

  // =========================
  // Sign In Email
  // =========================
  Future<void> signInwithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());

    final result = await authRepo.signInwithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(AuthFuiledState(failure.errMessage)),
      (user) {
        appCubit.setAuthenticated(user);
        emit(AuthSuccessState(user));
      },
    );
  }

  // =========================
  // Google Sign In
  // =========================
  Future<void> signInWithGoogle() async {
    emit(AuthLoadingState());

    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(AuthFuiledState(failure.errMessage)),
      (user) {
        appCubit.setAuthenticated(user);
        emit(AuthSuccessState(user));
      },
    );
  }

  // =========================
  // Facebook Sign In
  // =========================
  Future<void> signInWithFacebook() async {
    emit(AuthLoadingState());

    final result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(AuthFuiledState(failure.errMessage)),
      (user) {
        appCubit.setAuthenticated(user);
        emit(AuthSuccessState(user));
      },
    );
  }

  // =========================
  // Sign Out
  // =========================
  Future<void> signOut() async {
    emit(AuthLoadingState());

    final result = await authRepo.signOut();

    result.fold(
      (failure) => emit(AuthFuiledState(failure.errMessage)),
      (_) {
        appCubit.setUnauthenticated();
        emit(AuthInitial());
      },
    );
  }

Future<void> resetPassword(String email) async {
  emit(AuthLoadingState());

  final result = await authRepo.sendPasswordResetEmail(email);

  result.fold(
    (failure) => emit(AuthFuiledState(failure.errMessage)),
    (_) => emit(AuthPasswordResetEmailSent(
  "تم إرسال رابط إعادة تعيين كلمة المرور"
))
  );
}

Future<void> verifyPhone(String phone) async {
  emit(AuthLoadingState());

  final result = await authRepo.verifyPhoneNumber(phone);

  result.fold(
    (failure) => emit(AuthFuiledState(failure.errMessage)),
    (verificationId) {
      _verificationId = verificationId;
      emit(AuthCodeSent(verificationId));
    },
  );
}

Future<void> verifyOtp({
  required String smsCode,
}) async {
  if (_verificationId == null) {
    emit(AuthFuiledState("حدث خطأ في التحقق"));
    return;
  }

  emit(AuthLoadingState());

  final result = await authRepo.verifyOtp(
    verificationId: _verificationId!,
    smsCode: smsCode,
  );

  result.fold(
    (failure) => emit(AuthFuiledState(failure.errMessage)),
    (_) => emit(AuthOtpVerified()),
  );
}

Future<void> updatePassword(String newPassword) async {
  emit(AuthLoadingState());

  final result = await authRepo.updatePassword(newPassword);

  result.fold(
    (failure) => emit(AuthFuiledState(failure.errMessage)),
    (_) => emit(AuthPasswordUpdated()),
  );
}
void resetState() {
  emit(AuthInitial());
}

}