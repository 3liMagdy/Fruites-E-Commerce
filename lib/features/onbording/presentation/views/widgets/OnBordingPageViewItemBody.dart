import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/on_bording_page_view.dart';

class OnBordingPageViewItemBody extends StatelessWidget {
  final String backgraound, image;
  final String subtitle;
  final List<String> list_title;
  final Color color;


  const OnBordingPageViewItemBody({
    super.key,
    required this.backgraound,
    required this.image,
    required this.subtitle,
    required this.list_title, required this.color, 

  });
  @override
  Widget build(BuildContext context) {
    return OnBordingPageViewItem(
      backgraound:backgraound,

      image:  image,
      subtitle: subtitle,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: List.generate(list_title.length, (index) {
            Color color;

            if (index == 2) {
              color = AppColors.orange;
            } else if (index == 1) {
              color = AppColors.primaryColor;
            } else {
              color = Colors.black;
            }

            return TextSpan(
              text: list_title[index],
              style: CustomTextStyles.Cairo700style23.copyWith(color: color),
            );
          }),
        ),
      ), color: color,
    );
  }
}
