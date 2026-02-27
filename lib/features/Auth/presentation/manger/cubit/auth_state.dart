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


