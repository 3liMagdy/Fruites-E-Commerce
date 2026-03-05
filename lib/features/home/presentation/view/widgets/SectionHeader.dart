

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(AppStrings.bestSelling,
            style: CustomTextStyles.Cairo700style19),
        const Spacer(),
        Text(AppStrings.more,
            style: CustomTextStyles.Cairo700style16,textDirection:TextDirection.rtl ,),
        
      ],
    );
  }
}
