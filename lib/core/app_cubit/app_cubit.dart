
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthRepo authRepo;

  AppCubit(this.authRepo) : super(AppInitial());

  Future<void> checkAuthStatus() async{

    await Future.delayed(const Duration(seconds: 2));
    final user = authRepo.getCurrentUser();

    if (user != null) {
      emit(AppAuthenticated(user));
    } else {
      emit(AppUnauthenticated());
    }
  }

  void setAuthenticated(UserEntity user) {
    emit(AppAuthenticated(user));
  }

  void setUnauthenticated() {
    emit(AppUnauthenticated());
  }
}