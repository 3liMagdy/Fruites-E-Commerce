import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/FavoritesView/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data
    final List<ProductEntity> products = List.generate(
      4,
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
      appBar: AppBar(
        title: Text(AppStrings.favorites,
            style: CustomTextStyles.Cairo600style13.copyWith(color: AppColors.black)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.black),
        ),
      ),
      body: FavoritesViewBody(products: products),
    );
  }
}
