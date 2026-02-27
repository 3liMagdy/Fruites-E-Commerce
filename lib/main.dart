import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/app/fruits.dart';
import 'package:fruits_hub/core/app_cubit/app_cubit.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:fruits_hub/firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupServiceLocator();

 runApp(
  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AppCubit(getIt<AuthRepo>())..checkAuthStatus(),
      ),
      BlocProvider(
        create: (context) => AuthCubit(
          getIt<AuthRepo>(),
          context.read<AppCubit>(),
        ),
      ),
    ],
    child: const FruitsHub(),
  ),
);
}
