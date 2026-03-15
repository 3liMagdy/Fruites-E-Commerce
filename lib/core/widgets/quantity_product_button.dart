import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/buildAddButton.dart';
import 'package:fruits_hub/core/widgets/buildRemoveButton.dart';
import 'package:fruits_hub/features/cart/presentation/manger/cubit/cart_cubit.dart';

class QuantityProductButton extends StatelessWidget {
  const QuantityProductButton({super.key, required this.count, required this.product});
 final int count ;
   final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BuildAddButton(onTap: () {
           context.read<CartCubit>().increase(product);
        }),
        const SizedBox(width: 16),
         Text(
          '$count',
          style: CustomTextStyles.Cairo700style19,
        ),
        const SizedBox(width: 16),
        BuildRemoveButton(onTap: () {
            context.read<CartCubit>().decrease(product);
        }),
      ],
    );
  }
}