



import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomDots extends StatelessWidget {
    CustomDots({super.key,required this.controller});
   PageController controller ;     
  @override
  Widget build(BuildContext context) {
    final double hight=MediaQuery.of(context).size.height;
    return   SmoothPageIndicator(
      controller: controller,
      count: 2,
      effect: WormEffect(
        spacing: 8.0,
        dotWidth: 15.0,
        dotHeight: 15.0,

        dotColor: AppColors.grey,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1.5,
        activeDotColor: AppColors.primaryColor,
      ),
    );
  }
}