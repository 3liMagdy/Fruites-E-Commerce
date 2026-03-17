import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/CustomBtn.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key, required this.total});
  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.total,
                style: CustomTextStyles.Cairo600style13.copyWith(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                total,
                style: CustomTextStyles.Cairo600style13.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomBtn(
            onPressed: () {},
            text: AppStrings.checkout,
          ),
        ],
      ),
    );
  }
}
