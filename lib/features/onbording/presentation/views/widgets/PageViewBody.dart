import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/OnBordingPageViewItemBody.dart';

class PageviewBody extends StatelessWidget {
  const PageviewBody({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  final PageController controller;
  final ValueChanged<int> onPageChanged;
  @override
  Widget build(BuildContext context) {
    return  PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: [
        OnBordingPageViewItemBody(
          backgraound: AppAssets.imagesPageViewItem1BackgroundImage,
          image: AppAssets.imagesPageViewItem1Image,
          list_title: [AppStrings.welcome, AppStrings.fruit, AppStrings.hub],
          subtitle: AppStrings.subtitlePageOneOnbording,
          color: AppColors.backgroundonbording1,
        ),
        OnBordingPageViewItemBody(
          backgraound: AppAssets.imagesPageViewItem2BackgroundImage,
          image: AppAssets.imagesPageViewItem2Image,
          list_title: [AppStrings.titlePageOneOnbording2],
          subtitle: AppStrings.subtitlePageOneOnbording2,
          color: AppColors.backgroundonbording2,
        ),
      ],
    );
  }
}
