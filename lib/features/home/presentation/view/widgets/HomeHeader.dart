import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/database/cache/get_userEntity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class HomeHeader extends StatelessWidget {
   HomeHeader();
  @override
  Widget build(BuildContext context) {
    final user = getUserEntity();
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.notificationBackground,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.notifications_none, color: AppColors.primaryColor),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.notificationBadge,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              AppStrings.goodMorning,
              style: CustomTextStyles.Cairo400style13,
            ),
            Text(
             user?.name ?? "Guest",
               style: CustomTextStyles.Cairo700style19),
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
