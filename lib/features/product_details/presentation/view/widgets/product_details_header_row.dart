import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/price_section.dart';
import 'package:fruits_hub/core/widgets/quantity_product_button.dart';

class ProductDetailsHeaderRow extends StatelessWidget {
  const ProductDetailsHeaderRow({super.key, required this.productName, required this.price, required this.product});

  final String productName;
  final num price;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: CustomTextStyles.Cairo700style19.copyWith(fontSize: 20, color: AppColors.black),
              ),
              const SizedBox(height: 4),
              PriceSection(price: price.toDouble()),
            ],
          ),
        ),
         QuantityProductButton(
          product:product, 
          count: 4,),
      ],
    );
  }
}
