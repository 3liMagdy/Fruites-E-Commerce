import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';

class ProductRatingRow extends StatelessWidget {
  const ProductRatingRow({super.key, required this.rating});
  final  String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: AppColors.orange, size: 20),
        const SizedBox(width: 4),
        Text(
          rating,
          style: CustomTextStyles.Cairo600style13.copyWith(fontSize: 14),
        ),
        const SizedBox(width: 4),
        Text(
          '(30+)',
          style: CustomTextStyles.Cairo400style13.copyWith(fontSize: 14, color: AppColors.lightGrey),
        ),
        const SizedBox(width: 8),
        Text(
          AppStrings.review,
          style: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
