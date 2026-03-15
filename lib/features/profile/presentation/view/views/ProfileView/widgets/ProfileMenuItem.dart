import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    this.iconPath,
    this.iconData,
    this.onTap,
    this.trailing,
  });

  final String? iconPath;
  final IconData? iconData;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) trailing!,
          if (trailing == null)
            const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: AppColors.black,
            ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            if (iconPath != null)
            SvgPicture.asset(
              iconPath!,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          if (iconData != null)
            Icon(
              iconData,
              color: AppColors.primaryColor,
              size: 24,
            ),
            const SizedBox(width: 12),
          Text(
            title,
            style: CustomTextStyles.Cairo600style16.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
          
        
        ],
      ),
    );
  }
}
