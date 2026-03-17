import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/cart_item_footer.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/cart_item_header.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/cart_item_image.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
    this.quantity = 1,
  });

  final ProductEntity product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartItemImage(imageUrl: product.imageUrl ?? ''),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartItemHeader(product: product),
                Text(
                  // Dynamic display based on entity instead of hardcoded '1.0 كيلو'
                  '${product.unitAmount} كيلو',
                  style: CustomTextStyles.Cairo600style13.copyWith(
                    color: AppColors.orange,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                CartItemFooter(
                  quantity: quantity,
                  product: product,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
