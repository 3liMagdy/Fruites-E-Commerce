import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/quantity_product_button.dart';

class CartItemFooter extends StatelessWidget {
  const CartItemFooter({
    super.key,
    required this.product,
    required this.quantity,
  });

  final ProductEntity product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    // Dynamic price calculation
    final totalPrice = product.price * quantity;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QuantityProductButton(
          count: quantity,
          product: product,
        ),
        Text(
          '$totalPrice جنيه', // Assuming currency is EGP based on previous text style
          style: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
