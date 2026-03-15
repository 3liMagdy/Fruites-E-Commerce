import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/checkout_text_field.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class AddressStep extends StatelessWidget {
  const AddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.deliveryAddress,
            style: CustomTextStyles.Cairo600style13
                .copyWith(fontSize: 18, color: AppColors.black)),
        const SizedBox(height: 16),
        const CheckoutTextField(hint: AppStrings.fullName),
        const SizedBox(height: 12),
        const CheckoutTextField(hint: AppStrings.email, keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 12),
        const CheckoutTextField(hint: AppStrings.detailedAddress),
        const SizedBox(height: 12),
        const CheckoutTextField(hint: AppStrings.phone, keyboardType: TextInputType.phone),
      ],
    );
  }
}
