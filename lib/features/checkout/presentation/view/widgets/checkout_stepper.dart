import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CheckoutStepper extends StatelessWidget {
  const CheckoutStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<String> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(steps.length, (index) {
        return Row(
          children: [
            _StepIndicator(
              index: index,
              title: steps[index],
              isActive: index <= currentStep,
              isCompleted: index < currentStep,
            ),
            if (index < steps.length - 1)
              Container(
                width: 40,
                height: 2,
                margin: const EdgeInsets.only(bottom: 20),
                color: index < currentStep
                    ? AppColors.primaryColor
                    : AppColors.lighterGrey,
              ),
          ],
        );
      }),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({
    required this.index,
    required this.title,
    required this.isActive,
    required this.isCompleted,
  });

  final int index;
  final String title;
  final bool isActive;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(
                color: isActive ? AppColors.primaryColor : AppColors.lighterGrey),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : Text('${index + 1}',
                    style: TextStyle(
                        color: isActive ? Colors.white : AppColors.grey)),
          ),
        ),
        const SizedBox(height: 4),
        Text(title,
            style: CustomTextStyles.Cairo400style13.copyWith(
                fontSize: 10,
                color: isActive ? AppColors.primaryColor : AppColors.grey)),
      ],
    );
  }
}
