part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
final class AuthLoadingState extends AuthState {}
final class AuthSuccessState extends AuthState {
  final UserEntity user;
  const AuthSuccessState(this.user);
}
final class AuthFuiledState extends AuthState {
  final String errormessage;
  const AuthFuiledState(this.errormessage);
}

final class AuthPasswordResetEmailSent extends AuthState {
  final String message;
  const AuthPasswordResetEmailSent(this.message);
}

final class AuthCodeSent extends AuthState {
  final String verificationId;
  const AuthCodeSent(this.verificationId);
}

final class AuthOtpVerified extends AuthState {}

final class AuthPasswordUpdated extends AuthState {}
