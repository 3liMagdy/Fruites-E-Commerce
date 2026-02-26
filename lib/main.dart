import 'package:flutter/material.dart';
import 'package:fruits_hub/app/fruits.dart';
import 'package:fruits_hub/core/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Start service locator initialization but do NOT await here.
  // Awaiting plugin-backed async initializers before the engine and
  // plugin registration is guaranteed on the native side can cause
  // platform-channel failures. The app will wait for readiness inside
  // the top-level widget instead.
  setupServiceLocator();

  runApp(const FruitsHub());
}

