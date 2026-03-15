import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.number,
    required this.type,
    required this.expiry,
  });

  final String number;
  final String type;
  final String expiry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.credit_card, size: 30, color: AppColors.primaryColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(number,
                    style: CustomTextStyles.Cairo600style13
                        .copyWith(fontSize: 16, color: AppColors.black)),
                Text('$type | $expiry',
                    style: CustomTextStyles.Cairo400style13
                        .copyWith(color: AppColors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: AppColors.primaryColor),
        ],
      ),
    );
  }
}
