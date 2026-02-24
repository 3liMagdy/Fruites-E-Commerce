

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRotuer.router,
    );
  }
}