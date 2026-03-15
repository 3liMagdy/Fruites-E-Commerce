

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class Buildheader extends StatelessWidget {
  const Buildheader({super.key, required this.name});
 final String name;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.imagesTrash),
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}