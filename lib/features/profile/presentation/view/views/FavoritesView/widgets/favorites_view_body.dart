import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/widgets/ProductCard.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 173 / 214,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          onTapIcon: (){},
           onTap: (){
                    customNavigate(context, AppRotuer.kProductDetailsView);
                   },
          productEntity: products[index]);
      },
    );
  }
}
