

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
         SvgPicture.asset(
           height: 20,
           width: 20,
           AppAssets.imagesFilter,color: AppColors.grey,), 
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              AppStrings.searchHint,
              style: CustomTextStyles.Cairo400style13,
            ),
          ),
          SvgPicture.asset(
            height: 17,
            width: 17,
            AppAssets.imagesSearchIcon,color: AppColors.primaryColor,),
        ],
      ),
    );
  }
}