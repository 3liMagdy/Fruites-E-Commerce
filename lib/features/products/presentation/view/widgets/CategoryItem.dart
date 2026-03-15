import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
    this.isActive = false,
  });

  final String image;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : AppColors.lighterGrey,
            shape: BoxShape.circle,
          ),
          child: ClipOval(child: Image.network(image, fit: BoxFit.cover)),
        ),
       
        Text(
          title,
          style: CustomTextStyles.Cairo600style13.copyWith(
            color: isActive ? AppColors.primaryColor : AppColors.lightGrey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
