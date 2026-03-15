import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/summary_row.dart';

class ReviewStep extends StatelessWidget {
  const ReviewStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.orderReview,
            style: CustomTextStyles.Cairo600style13
                .copyWith(fontSize: 18, color: AppColors.black)),
        const SizedBox(height: 16),
        Text('${AppStrings.address}: القاهرة، مصر',
            style: CustomTextStyles.Cairo400style14),
        Text('${AppStrings.payment}: ${AppStrings.cashOnDelivery}',
            style: CustomTextStyles.Cairo400style14),
        const SizedBox(height: 24),
        const Divider(),
        const SummaryRow(label: AppStrings.subTotal, value: '120 جنيه'),
        const SummaryRow(label: AppStrings.delivery, value: '15 جنيه'),
        const Divider(),
        const SummaryRow(label: AppStrings.total, value: '135 جنيه', isTotal: true),
      ],
    );
  }
}
