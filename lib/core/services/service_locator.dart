

import 'package:fruits_hub/core/database/cache/cache_helper.dart';
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
}