


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CustonBtn extends StatelessWidget {
  const CustonBtn({super.key, required this.onpressed, required this.text});
 final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: onpressed,
        child: Text(text, style: CustomTextStyles.Cairo700style16),
      ),
    );
  }
}