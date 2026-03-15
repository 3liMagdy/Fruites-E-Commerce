

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class BuildRemoveButton extends StatelessWidget {
  const BuildRemoveButton({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.remove,
          color: AppColors.black,
          size: 20,
        ),
      ),
    );
  }
}
