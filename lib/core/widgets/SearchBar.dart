

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({required this.onTap});
  final VoidCallback onTap;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SvgPicture.asset(
              AppAssets.imagesSearchIcon,
              height: 17,
              width: 17,
              colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
          
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                AppStrings.searchHint,
                style: CustomTextStyles.Cairo400style13.copyWith(color: AppColors.lightGrey),
              ),
            ),
             SvgPicture.asset(
              AppAssets.imagesFilter,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(AppColors.lightGrey, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}