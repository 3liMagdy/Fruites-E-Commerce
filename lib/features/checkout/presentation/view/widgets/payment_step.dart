import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/payment_option.dart';

class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.paymentMethods,
            style: CustomTextStyles.Cairo600style13
                .copyWith(fontSize: 18, color: AppColors.black)),
        const SizedBox(height: 16),
        PaymentOption(
          title: AppStrings.cashOnDelivery,
          icon: Icons.money,
          isSelected: true,
          onTap: () {},
        ),
        const SizedBox(height: 12),
        PaymentOption(
          title: AppStrings.creditCard,
          icon: Icons.credit_card,
          isSelected: false,
          onTap: () {},
        ),
        const SizedBox(height: 12),
        PaymentOption(
          title: AppStrings.paypal,
          icon: Icons.payment,
          isSelected: false,
          onTap: () {},
        ),
      ],
    );
  }
}
