


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';

class VisibilityButton extends StatelessWidget {
  const VisibilityButton({
    super.key, required this.isVisible, required this.onpressed,
    
  });

  final bool isVisible;
  final VoidCallback onpressed;



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
          child: CustonBtn(
            onpressed: onpressed,
            text: AppStrings.startnow,
          ),
        ),
      ),
    );
  }
}
