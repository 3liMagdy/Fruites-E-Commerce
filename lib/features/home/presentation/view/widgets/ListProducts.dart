
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_state.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/ProductCard.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProductCard(
                  productEntity: state.products[index],
                );
              },
              childCount: state.products.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.8,
            ),
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}