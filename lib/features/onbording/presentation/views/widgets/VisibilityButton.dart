


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustomBtn.dart';

class VisibilityButton extends StatelessWidget {
  const VisibilityButton({
    super.key, required this.isVisible, required this.onPressed,
    
  });

  final bool isVisible;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 17),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomBtn(
            onPressed: onPressed,
            text: AppStrings.startnow,
          ),
        ),
      ),
    );
  }
}
