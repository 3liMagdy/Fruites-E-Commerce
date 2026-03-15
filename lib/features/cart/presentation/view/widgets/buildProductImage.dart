

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class Buildproductimage extends StatelessWidget {
  const Buildproductimage({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.lighterGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.network(image),
    );
  }
}