import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';

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
    return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
          ),
      child: BottomNavigationBar(
        
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.lightGrey,
      
        backgroundColor: Colors.white,
        items: [
         BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.imagesUser,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.imagesUserFill
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.imagesCart,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.imagesCartFill
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.imagesShopping,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.imagesShoppingFill
            ),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.imagesHome,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.imagesHomeFill
            ),
            label: AppStrings.home,
          ),
        ],
      ),
    );
  }
}
