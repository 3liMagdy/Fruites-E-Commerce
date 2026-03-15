import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/buildAddButton.dart';
import 'package:fruits_hub/core/widgets/buildFavoriteButton.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productEntity,
    required this.onTap, required this.onTapIcon,
  });
  final ProductEntity productEntity;
  final VoidCallback onTap;
   final VoidCallback onTapIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFavoriteButton(),
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Hero(
                    tag: productEntity.name,
                    child: productEntity.imageUrl != null
                        ? Container(
                            color: Colors.white,
                            child: Image.network(
                              productEntity.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.asset(
                            width: double.infinity,
                            AppAssets.imagesWatermelonTest,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                productEntity.name,
                style: CustomTextStyles.Cairo600style13.copyWith(
                  color: AppColors.black,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${productEntity.price} ${AppStrings.currencyPerKg}",
                    style: CustomTextStyles.Cairo600style13.copyWith(
                      color: AppColors.orange,
                      fontSize: 14,
                    ),
                  ),
                  BuildAddButton(
                    onTap: onTapIcon,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
