


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomBoxDeccrption extends StatelessWidget {
  const CustomBoxDeccrption({super.key, required this.subtitle, required this.title});
final String subtitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 37),
            child: Column(
              children: [
                Center(child: title),
                SizedBox(height: 24),
                Text(
                  subtitle,
                  style: CustomTextStyles.Cairo600style13,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
  }
}