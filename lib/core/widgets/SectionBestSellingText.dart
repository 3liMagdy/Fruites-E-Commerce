

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class SectionBestSellingText extends StatelessWidget {
  const SectionBestSellingText();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.bestSelling,
          style: CustomTextStyles.Cairo700style19.copyWith(color: AppColors.black),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            AppStrings.more,
            style: CustomTextStyles.Cairo400style13.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}
