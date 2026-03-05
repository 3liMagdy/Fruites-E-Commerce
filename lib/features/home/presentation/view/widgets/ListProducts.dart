


import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/ProductCard.dart';

class ListProducts extends StatelessWidget {
  const ListProducts();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const ProductCard();
        },
        childCount: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.8,
      ),
    );
  }
}