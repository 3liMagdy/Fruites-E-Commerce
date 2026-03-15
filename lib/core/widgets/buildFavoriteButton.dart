

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class buildFavoriteButton extends StatelessWidget {
  const buildFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 8,bottom: 8),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.favorite_border,
            size: 20,
            color: AppColors.lightGrey,
          ),
        ),
      ),
    );
  }
}