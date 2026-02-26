


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({super.key, this.textAlign, required this.text1, required this.text2});
  final TextAlign? textAlign;
  final String text1,text2; 
  @override
  Widget build(BuildContext context) {
    return RichText(
      
      textAlign:textAlign ?? TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: CustomTextStyles.Cairo600style16,
          ),
          TextSpan(
            text:text2 ,
            style: CustomTextStyles.Cairo600style16.copyWith(
              color: AppColors.green500,
            ),
          ),
        ],
      ),
    );
  }
}