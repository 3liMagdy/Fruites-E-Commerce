


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class Builddescriptionsection extends StatelessWidget {
  const Builddescriptionsection({super.key, required this.description});
 final String description;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.aboutProduct,
          style: CustomTextStyles.Cairo600style16.copyWith(
            color: AppColors.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
         description,
          style: CustomTextStyles.Cairo400style13.copyWith(
            color: AppColors.grey,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}