

import 'package:fruits_hub/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  final cacheHelper = CacheHelper();
  await cacheHelper.init();

  getIt.registerSingleton<CacheHelper>(cacheHelper);
}