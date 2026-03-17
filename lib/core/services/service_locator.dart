

import 'package:fruits_hub/core/app_cubit/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/database/cache/cache_helper.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/core/repos/products_repo_impl.dart';
import 'package:fruits_hub/core/services/ProductsDatabaseService.dart';
import 'package:fruits_hub/core/services/SupabaseDatabaseService.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/features/Auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:fruits_hub/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:fruits_hub/features/cart/domain/repositories/cart_repository.dart';
import 'package:fruits_hub/features/cart/domain/usecases/manage_cart_use_case.dart';
import 'package:fruits_hub/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {

  /// Cache
  getIt.registerSingletonAsync<CacheHelper>(() async {
    final prefs = await SharedPreferences.getInstance();
    return CacheHelper(prefs);
  });

  /// Data Service
  getIt.registerLazySingleton<DataService>(
    () => SupabaseDatabaseService(
      getIt<SupabaseClient>(),
    ),
  );

  /// Firebase Auth
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(),
  );

  /// Auth Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      getIt<FirebaseAuthService>(),
      dataService: getIt<DataService>(),
    ),
  );

  /// Supabase Client
  getIt.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );

  /// Products Database Service
  getIt.registerLazySingleton<ProductsDatabaseService>(
    () => SupabaseProductsDatabaseService(
      getIt<SupabaseClient>(),
    ),
  );

  /// Products Repository
  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImpl(
      getIt<ProductsDatabaseService>(),
    ),
  );

  /// Products Cubit
  getIt.registerFactory(
    () => ProductsCubit(
      getIt<ProductsRepo>(),
    ),
  );
   
   getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      localDataSource: getIt<CartLocalDataSource>(),
    ),
  );
   getIt.registerLazySingleton<CartLocalDataSource>(
   () => CartLocalDataSourceImpl(),
  ); 
  


  getIt.registerLazySingleton<ManageCartUseCase>(
    () => ManageCartUseCase(
      getIt<CartRepository>(),
    ),
  );

   getIt.registerFactory(
    () => CartCubit(
      manageCartUseCase: getIt<ManageCartUseCase>(),
    ),
  );
}