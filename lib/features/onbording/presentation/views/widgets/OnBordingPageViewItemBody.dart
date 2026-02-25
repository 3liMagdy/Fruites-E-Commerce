



import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/on_bording_page_view.dart';

class OnBordingPageViewItemBody extends StatelessWidget {
  final String backgraound,image;
  final String subtitle;
  final List<String> list_title;


  
  const OnBordingPageViewItemBody({super.key, required this.backgraound, required this.image, required this.subtitle, required this.list_title});
  @override
  Widget build(BuildContext context) {
    return  OnBordingPageViewItem(
          backgraound: AppAssets.AppAssetsImagesPageViewItem1BackgroundImage,
          image: AppAssets.AppAssetsImagesPageViewItem1Image,
          subtitle: AppStrings.subtitlePageOneOnbording,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(list_title[0], style: CustomTextStyles.Cairo700style23),
              Text(
                list_title[1],
                style: CustomTextStyles.Cairo700style23.copyWith(
                  color: AppColors.orange,
                ),
              ),
              Text(list_title[2],
                style: CustomTextStyles.Cairo700style23.copyWith(
                  color: AppColors.primaryColor,
                  
                ),),
            ],
          ),
        );
  }
}