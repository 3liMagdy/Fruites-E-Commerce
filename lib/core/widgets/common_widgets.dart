import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(AppStrings.filter,
                  style: CustomTextStyles.Cairo600style13
                      .copyWith(fontSize: 18, color: AppColors.black))),
          const SizedBox(height: 24),
          Text(AppStrings.sortBy,
              style: CustomTextStyles.Cairo600style13
                  .copyWith(color: AppColors.black)),
          const SizedBox(height: 12),
          Wrap(
            children: [
              _buildFilterChip(AppStrings.all, true),
              _buildFilterChip(AppStrings.freshFruit, false),
              _buildFilterChip(AppStrings.vegetables, false),
            ],
          ),
          const SizedBox(height: 24),
          Text(AppStrings.priceRange,
              style: CustomTextStyles.Cairo600style13
                  .copyWith(color: AppColors.black)),
          const SizedBox(height: 12),
          Wrap(
            children: [
              _buildFilterChip(AppStrings.lowestPrice, false),
              _buildFilterChip(AppStrings.highestPrice, false),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(AppStrings.apply,
                      style: CustomTextStyles.Cairo600style13
                          .copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.lighterGrey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: CustomTextStyles.Cairo400style13
            .copyWith(color: isActive ? Colors.white : AppColors.black),
      ),
    );
  }
}

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.sortBy,
              style: CustomTextStyles.Cairo600style13
                  .copyWith(fontSize: 18, color: AppColors.black)),
          const SizedBox(height: 16),
          _buildSortOption(AppStrings.bestSeller, true),
          _buildSortOption(AppStrings.highestRated, false),
          _buildSortOption(AppStrings.priceLowToHigh, false),
          _buildSortOption(AppStrings.priceHighToLow, false),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSortOption(String title, bool isActive) {
    return ListTile(
      title: Text(title,
          style: CustomTextStyles.Cairo400style14
              .copyWith(color: isActive ? AppColors.primaryColor : AppColors.black)),
      trailing: isActive
          ? const Icon(Icons.check, color: AppColors.primaryColor)
          : null,
      onTap: () {},
    );
  }
}

Future<void> showLogoutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(AppStrings.logout,
            textAlign: TextAlign.center,
            style: CustomTextStyles.Cairo600style13.copyWith(fontSize: 18)),
        content: Text(AppStrings.logoutConfirmation,
            textAlign: TextAlign.center,
            style: CustomTextStyles.Cairo400style13),
        actions: <Widget>[
          TextButton(
            child: Text(AppStrings.cancel,
                style: CustomTextStyles.Cairo600style13
                    .copyWith(color: AppColors.grey)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(AppStrings.logout,
                style: CustomTextStyles.Cairo600style13
                    .copyWith(color: Colors.red)),
            onPressed: () {
              // Sign out logic
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
