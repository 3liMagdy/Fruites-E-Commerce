import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  final String label;
  final String value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: isTotal
                  ? CustomTextStyles.Cairo600style13.copyWith(fontSize: 18, color: AppColors.black)
                  : CustomTextStyles.Cairo400style14.copyWith(color: AppColors.black)),
          Text(value,
              style: isTotal
                  ? CustomTextStyles.Cairo600style13.copyWith(
                      fontSize: 18, color: AppColors.primaryColor)
                  : CustomTextStyles.Cairo400style14.copyWith(color: AppColors.black)),
        ],
      ),
    );
  }
}
