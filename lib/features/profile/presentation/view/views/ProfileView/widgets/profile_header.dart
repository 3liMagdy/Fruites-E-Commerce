import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(AppAssets.imagesProfileImage),
            ),
            Positioned(
              bottom: 0,
              left: 4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  onTap: (){},
                  child: Icon(
                  Icons.camera_alt_outlined,
                    color: AppColors.primaryColor,
                   size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
         const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: CustomTextStyles.Cairo700style16.copyWith(
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: CustomTextStyles.Cairo400style13.copyWith(
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
