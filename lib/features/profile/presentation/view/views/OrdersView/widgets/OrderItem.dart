import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Column(
        children: [
          _buildOrderHeader(),
          Divider(height: 24, color: AppColors.borderGrey),
          _buildOrderDetails(),
        ],
      ),
    );
  }

  Widget _buildOrderHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${AppStrings.myOrders} #12345',
          style: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.notificationBackground,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            'قيد التوصيل', // Placeholder for dynamic status
            style: CustomTextStyles.Cairo600style13.copyWith(
              color: AppColors.primaryColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetails() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.lighterGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.shopping_bag_outlined, color: AppColors.primaryColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '3 منتجات', // Placeholder for dynamic data
                style: CustomTextStyles.Cairo600style13.copyWith(
                  color: AppColors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                '25 فبراير 2024', // Placeholder for dynamic data
                style: CustomTextStyles.Cairo600style14Primary.copyWith(
                  color: AppColors.lightGrey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Text(
          '120 جنيه', // Placeholder for dynamic data
          style: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
