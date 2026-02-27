import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/app_cubit/app_cubit.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo, this.appCubit) : super(AuthInitial());
  final AuthRepo authRepo;
   final AppCubit appCubit;
  Future<void> signUp(
    { required String name,
    required String email,
    required String password,}
  ) async {
    emit(AuthLoadingState());
    try {
      final user = await authRepo.signUp(
        name: name,
        email: email,
        password: password,
      );
      emit(AuthSuccessState( user));
    }catch(e){
      emit(AuthFuiledState(e.toString()));
    }
    
  }

  Future<void> signInwithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    try {
      final user = await authRepo.signInwithEmailAndPassword(
        email: email,
        password: password,
      );
      appCubit.setAuthenticated(user);
      emit(AuthSuccessState( user));
    }catch(e){
      emit(AuthFuiledState(e.toString()));
    }
  }


  Future<void> signInWithGoogle() async {
  emit(AuthLoadingState());
  try {
    final user = await authRepo.signInWithGoogle();

    appCubit.setAuthenticated(user);

    emit(AuthSuccessState(user));
  } catch (e) {
    emit(AuthFuiledState(e.toString()));
  }
}

Future<void> signInWithFacebook() async {
  emit(AuthLoadingState());
  try {
    final user = await authRepo.signInWithFacebook();
    appCubit.setAuthenticated(user);
    emit(AuthSuccessState(user));
  } catch (e) {
    emit(AuthFuiledState(e.toString()));
  }
}

Future<void> signInWithApple() async {
  emit(AuthLoadingState());
  try {
    final user = await authRepo.signInWithApple();
    appCubit.setAuthenticated(user);
    emit(AuthSuccessState(user));
  } catch (e) {
    emit(AuthFuiledState(e.toString()));
  }
}

  Future <void> signOut() async {
    emit(AuthLoadingState());
    try {
      await authRepo.signOut();
      appCubit.setUnauthenticated();
      emit(AuthInitial());
    }catch(e){
      emit(AuthFuiledState(e.toString()));
    }
  }



}
