


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: AuthStrings.dontHaveAccount,
            style: CustomTextStyles.Cairo600style16,
          ),
          TextSpan(
            text: AuthStrings.createAccountTitle,
            style: CustomTextStyles.Cairo600style16.copyWith(
              color: AppColors.green500,
            ),
          ),
        ],
      ),
    );
  }
}