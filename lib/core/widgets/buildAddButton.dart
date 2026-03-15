

 import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';


class BuildAddButton extends StatelessWidget {
  const BuildAddButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}


