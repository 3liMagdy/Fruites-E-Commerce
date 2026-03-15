

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class buildNotificationIcon extends StatelessWidget {
  const buildNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}