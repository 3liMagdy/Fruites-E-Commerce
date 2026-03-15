import 'package:flutter/material.dart';
import 'package:fruits_hub/features/products/presentation/view/widgets/ListCategories.dart';

class CategoriesSliver extends StatelessWidget {
  const CategoriesSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: ListCategories(),
      ),
    );
  }
}