import 'package:flutter/material.dart';
import 'package:fruits_hub/app/fruits.dart';
import 'package:fruits_hub/core/database/cache/cache_helper.dart';
import 'package:fruits_hub/core/services/service_locator.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();
  
  runApp(const FruitsHub());
}

