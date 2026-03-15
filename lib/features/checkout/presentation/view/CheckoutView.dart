import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustomBtn.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/checkout_stepper.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/address_step.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/payment_step.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/review_step.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int _currentStep = 0;

  final List<String> _steps = [
    AppStrings.address,
    AppStrings.payment,
    AppStrings.review
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(AppStrings.checkout,
            style: CustomTextStyles.Cairo600style13.copyWith(color: AppColors.black)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (_currentStep > 0) {
              setState(() => _currentStep--);
            } else {
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutStepper(steps: _steps, currentStep: _currentStep),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildStepContent(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomBtn(
              onPressed: () {
                if (_currentStep < _steps.length - 1) {
                  setState(() => _currentStep++);
                } else {
                  // Order placed logic (UI only)
                }
              },
              text: _currentStep == _steps.length - 1
                  ? AppStrings.confirmOrder
                  : AppStrings.next,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return const AddressStep();
      case 1:
        return const PaymentStep();
      case 2:
        return const ReviewStep();
      default:
        return const SizedBox();
    }
  }
}
