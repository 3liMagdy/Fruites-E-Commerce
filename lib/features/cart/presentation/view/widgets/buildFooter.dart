

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/quantity_product_button.dart';

class Buildfooter extends StatelessWidget {
  const Buildfooter({super.key, required this.price, required this.count, required this.product});
  final String price;
    final int count;
      final ProductEntity product;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       QuantityProductButton(
        count: count,
        product: product,
       ),
        Text(
          price, // Placeholder for dynamic data
          style: CustomTextStyles.Cairo600style13.copyWith(
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}