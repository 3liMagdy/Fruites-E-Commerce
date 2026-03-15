import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.lightGrey,
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.primaryColor,
            fontSize: 10,
          ),
          unselectedLabelStyle: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.lightGrey,
            fontSize: 10,
          ),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.imagesHome),
              activeIcon: Image.asset(AppAssets.imagesHomeFill, width: 24, height: 24),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.imagesCart),
              activeIcon: SvgPicture.asset(AppAssets.imagesCartFill),
              label: AppStrings.cart,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.imagesShopping),
              activeIcon: SvgPicture.asset(AppAssets.imagesShoppingFill),
              label: AppStrings.products,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.imagesUser),
              activeIcon: SvgPicture.asset(AppAssets.imagesUserFill),
              label: AppStrings.profile,
            ),
          ],
        ),
      ),
    );
  }
}
