

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomtxetConuntCart extends StatelessWidget {
  const CustomtxetConuntCart({super.key, required this.count});
  final int count ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEBF9F1),
      width: double.infinity,
      height: 41,
      child: Center(
        child: Text(
          '${AppStrings.txethaveConuntCart} $count ${AppStrings.txetConuntCart}',
          textAlign: TextAlign.center,
          style: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}