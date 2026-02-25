import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/OnBordingPageViewItemBody.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/on_bording_page_view.dart';

class OnBordingViewBody extends StatelessWidget {
  const OnBordingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        OnBordingPageViewItemBody(
          backgraound: AppAssets.AppAssetsImagesPageViewItem1BackgroundImage,
          image: AppAssets.AppAssetsImagesPageViewItem1Image,
          list_title: [
            AppStrings.welcome,
            AppStrings.hub,
            AppStrings.fruit,
          ], subtitle: AppStrings.subtitlePageOneOnbording,
        ),
      ],
    );
  }
}

