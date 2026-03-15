import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/product_feature_card.dart';

class ProductFeaturesGrid extends StatelessWidget {
  const ProductFeaturesGrid({super.key, required this.reviews, required this.expiration, required this.unitAmount});
  final String reviews;
    final String expiration;
      final String unitAmount;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              ProductFeatureCard(
                icon: const Icon(Icons.eco, color: AppColors.green600, size: 20),
                title: '100%',
                subtitle: 'اورجانيك',
              ),
              const SizedBox(height: 16),
              ProductFeatureCard(
                icon: const Icon(Icons.star, color: AppColors.orange, size: 20),
                title: reviews,
                subtitle: 'Reviews',
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              ProductFeatureCard(
                icon: const Icon(Icons.calendar_month, color: AppColors.green600, size: 20),
                title:expiration,
                subtitle: 'الصلاحية',
              ),
              const SizedBox(height: 16),
              ProductFeatureCard(
                icon: const Icon(Icons.local_fire_department, color: AppColors.orange, size: 20),
                title:unitAmount,
                subtitle: '100 جرام',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
