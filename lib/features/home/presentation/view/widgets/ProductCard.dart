


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.favorite_border, size: 18),
          const Expanded(
            child: Center(
              child: Image(
                image: AssetImage(AppAssets.imagesWatermelonTest),
              ),
            ),
          ),
          Row(
           crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "فراولة",
                      style: CustomTextStyles.Cairo600style13),
                  const SizedBox(height: 4),
                  Text("20 ${AppStrings.currencyPerKg}",
                      style: CustomTextStyles.Cairo600style13
                          .copyWith(color: AppColors.orange)),
                 
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.primaryColor,
                child: const Icon(Icons.add,
                    color: Colors.white, size: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}