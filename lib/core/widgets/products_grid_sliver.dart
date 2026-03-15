import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/widgets/ProductCard.dart';
import 'package:fruits_hub/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:go_router/go_router.dart';

class ProductsGridSliver extends StatelessWidget {
  const ProductsGridSliver({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return ProductCard(
            onTapIcon: (){
               context.read<CartCubit>().addProduct(products[index]);
            },
            onTap: () {
              GoRouter.of(
                context,
              ).push(AppRotuer.kProductDetailsView, extra: products[index]);
            },
            productEntity: products[index],
          );
        }, childCount: products.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 173 / 214,
        ),
      ),
    );
  }
}
