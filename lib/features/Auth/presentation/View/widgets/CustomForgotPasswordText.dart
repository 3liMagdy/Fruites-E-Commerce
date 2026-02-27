


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomForgotPasswordText extends StatelessWidget {
  const CustomForgotPasswordText({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap, 
      child: Text(
        AuthStrings.forgotPassword,
        style: CustomTextStyles.Cairo600style13.copyWith(
          color: AppColors.green600,
        ),
      ),
    );
  }
}