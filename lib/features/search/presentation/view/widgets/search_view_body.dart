import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustomTopBar.dart';
import 'package:fruits_hub/core/widgets/Sliver_SearchBar.dart';
import 'package:fruits_hub/core/widgets/products_grid_sliver.dart';
import 'package:fruits_hub/features/search/presentation/view/widgets/search_results_header.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
   Widget build(BuildContext context) {
    final List<ProductEntity> products = List.generate(
      6,
      (index) => ProductEntity(
        id: index.toString(),
        name: index % 2 == 0 ? 'أفوكادو' : 'بطيخ عراقي',
        code: '123',
        description: 'وصف المنتج',
        price: 30,
        isFeatured: false,
        imageUrl: null,
        expirationsMonths: 6,
        numberOfCalories: 100,
        unitAmount: 1,
        isOrganic: true,
        reviews: [],
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: CustomScrollView(
  slivers: [

    SliverToBoxAdapter(
      child: CustomTopBar(
        imageicon: AppAssets.imagesIconArrow,
        title: AppStrings.search,
        
      ),
    ),

    const SearchBarSliver(),

    ResultsHeaderSliver(
      resultsCount: products.length,
    ),

    ProductsGridSliver(
      products: products,
    ),
  ],
)
      );
   
  }
}
