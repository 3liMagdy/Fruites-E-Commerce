import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/ProfileView/widgets/ProfileMenuItem.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/ProfileView/widgets/logout_button.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/ProfileView/widgets/profile_header.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/ProfileView/widgets/profile_section_title.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'حسابي',
                    style: CustomTextStyles.Cairo700style19,
                  ),
                ),
                const SizedBox(height: 24),
                const ProfileHeader(
                  name: 'أحمد ياسر',
                  email: 'mail@mail.com',
                ),
                const SizedBox(height: 24),
                const ProfileSectionTitle(title: 'عام'),
                ProfileMenuItem(
                  title: AppStrings.profile,
                  iconPath: AppAssets.imagesUser,
                  onTap: () {
                    customNavigate(context, AppRotuer.kEditProfileView);
                  },
                ),
                const Divider(height: 1, color: AppColors.borderGrey),
                ProfileMenuItem(
                  title: AppStrings.myOrders,
                  iconPath: AppAssets.imagesShopping,
                  onTap: () {
                     customNavigate(context, AppRotuer.kOrdersView);
                  },
                ),
                const Divider(height: 1, color: AppColors.borderGrey),
                ProfileMenuItem(
                  title: AppStrings.payment,
                  iconData: Icons.wallet_outlined,
                  onTap: () {
                     customNavigate(context, AppRotuer.kPaymentMethodsView);
                  },
                ),
                const Divider(height: 1, color: AppColors.borderGrey),
                ProfileMenuItem(
                  title: AppStrings.favorites,
                  iconData: Icons.favorite_border,
                  onTap: () {
                     customNavigate(context, AppRotuer.kFavoritesView);
                  },
                ),
                const Divider(height: 1, color: AppColors.borderGrey),
                ProfileMenuItem(
                  title: AppStrings.notifications,
                  iconPath: AppAssets.imagesNotification,
                  trailing: Switch(
                    value: false,
                    onChanged: (val) {
                      
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                ),
                const Divider(height: 1, color: AppColors.borderGrey),
                ProfileMenuItem(
                  title: 'اللغة',
                  iconData: Icons.language,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'العربية',
                        style: CustomTextStyles.Cairo600style13.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_back_ios_new, size: 14),
                    ],
                  ),
                ),
                const Divider(height: 1, color: AppColors.borderGrey),
                ProfileMenuItem(
                  title: 'الوضع',
                  iconData: Icons.dark_mode_outlined,
                  trailing: Switch(
                    value: false,
                    onChanged: (val) {},
                    activeColor: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 24),
                const ProfileSectionTitle(title: 'المساعدة'),
                ProfileMenuItem(
                  title: AppStrings.aboutUs,
                  iconData: Icons.info_outline,
                  onTap: () {
                     customNavigate(context, AppRotuer.kAboutUsView);
                  },
                ),
                const SizedBox(height: 40),
                LogoutButton(
                  text: AppStrings.logout,
                  onPressed: () {},
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
