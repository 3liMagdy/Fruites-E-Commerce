import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/common_widgets.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/ProfileView/widgets/ProfileMenuItem.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileMenuItem(
            iconPath: AppAssets.imagesUser,
            title: AppStrings.editProfile,
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            iconPath: AppAssets.imagesLocation,
            title: AppStrings.addresses,
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            iconPath: AppAssets.imagesShopping,
            title: AppStrings.myOrders,
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            iconPath: AppAssets.imagesUser,
            title: AppStrings.favorites,
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            iconPath: AppAssets.imagesNotification,
            title: AppStrings.notifications,
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            iconPath: AppAssets.imagesTune,
            title: AppStrings.settings,
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            iconPath: AppAssets.imagesUser,
            title: AppStrings.aboutUs,
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            iconPath: AppAssets.imagesUser,
            title: AppStrings.logout,
            onTap: () => showLogoutDialog(context),
            trailing: const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: Color(0xFFF1F1F5), indent: 40);
  }
}
