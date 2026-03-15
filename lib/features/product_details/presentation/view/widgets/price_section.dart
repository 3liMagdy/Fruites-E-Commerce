import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price ${AppStrings.currencyPerKg}',
      style: CustomTextStyles.Cairo600style13.copyWith(
        color: AppColors.orange,
        fontSize: 18,
      ),
    );
  }
}
