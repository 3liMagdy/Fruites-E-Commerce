

import 'package:fruits_hub/core/database/cache/cache_helper.dart';
import 'package:fruits_hub/features/Auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/Auth/data/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/Auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register CacheHelper as an async singleton so the instance that
  // depends on `SharedPreferences` is created asynchronously when the
  // native plugin is ready. Do not await this here from `main()` —
  // await `getIt.allReady()` inside the app UI (splash) to avoid
  // calling platform channels before native plugin registration.
  getIt.registerSingletonAsync<CacheHelper>(() async {
    final prefs = await SharedPreferences.getInstance();
    return CacheHelper(prefs);
  });

   getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt()),
  );
}