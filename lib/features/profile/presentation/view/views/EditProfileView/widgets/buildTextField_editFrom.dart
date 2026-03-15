


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class BuildtextfieldEditfrom extends StatelessWidget {
  const BuildtextfieldEditfrom({super.key,  this.isObscure = false, this.initialValue,  required this.label});
  final String? initialValue;
  final bool? isObscure ;
  final String label;
  @override
  Widget build(BuildContext context) {
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: CustomTextStyles.Cairo600style13
                .copyWith(color: AppColors.black, fontSize: 14)),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          obscureText: isObscure!,
          style: CustomTextStyles.Cairo400style14.copyWith(color: AppColors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.lighterGrey,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}