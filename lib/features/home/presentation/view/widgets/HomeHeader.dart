import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/database/cache/get_userEntity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/buildNotificationIcon.dart';

class HomeHeader extends StatelessWidget {
   HomeHeader();
  @override
  Widget build(BuildContext context) {
    final user = getUserEntity();
    return Row(
      children: [
        buildNotificationIcon(),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              AppStrings.goodMorning,
              style: CustomTextStyles.Cairo400style13,
            ),
            Text(
              user?.name ?? "عميل", // Using "عميل" instead of "Guest"
              style: CustomTextStyles.Cairo700style19.copyWith(color: AppColors.black),
            ),
          ],
        ),
        const SizedBox(width: 11),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(AppAssets.imagesProfileImage),
        ),
      ],
    );
  }

 
}
