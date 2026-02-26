


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white),
        color: AppColors.white,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side: BorderSide(color: AppColors.lightGrey)  ),
          
          elevation: 0,
        ),
        onPressed: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(alignment: Alignment.centerRight, child: icon),
            Text(
              text,
              style: CustomTextStyles.Cairo600style16.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}