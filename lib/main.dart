import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/app/fruits.dart';
import 'package:fruits_hub/core/app_cubit/app_cubit.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/services/shared_prefs.dart';
import 'package:fruits_hub/core/utils/supabase_keys.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:fruits_hub/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Supabase init
  await Supabase.initialize(
     url: SupabaseKeys.url,
  anonKey: SupabaseKeys.anonKey,
  );

  await SharedPrefs.init();
  await setupServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (_) => CartCubit(),
    ),
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
