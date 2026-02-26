


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomForgotPasswordText extends StatelessWidget {
  const CustomForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AuthStrings.forgotPassword,
      style: CustomTextStyles.Cairo600style13.copyWith(
        color: AppColors.green600,
      ),
    );
  }
}