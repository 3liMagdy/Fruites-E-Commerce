

import 'package:flutter/material.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/ResetpasswordviewBody.dart';

class Resetpasswordview extends StatelessWidget {
  const Resetpasswordview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ResetpasswordviewBody(),
      ),
    );
  }
}