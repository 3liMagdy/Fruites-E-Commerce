import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/PaymentMethodsView/widgets/payment_method_card.dart';

class PaymentMethodsViewBody extends StatelessWidget {
  const PaymentMethodsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PaymentMethodCard(
            number: '**** **** **** 1234', type: 'Visa', expiry: '05/26'),
        const SizedBox(height: 16),
        const PaymentMethodCard(
            number: '**** **** **** 5678', type: 'Mastercard', expiry: '12/25'),
        const SizedBox(height: 32),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_circle_outline, color: AppColors.primaryColor),
          label: Text(AppStrings.addPaymentMethod,
              style: CustomTextStyles.Cairo600style13
                  .copyWith(color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}
