import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/add_to_cart_button.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/buildDescriptionSection.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/product_details_header_row.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/product_features_grid.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/product_image_section.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/product_rating_row.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
         
        /// Image Section
         SliverToBoxAdapter(
          child: ProductImageSection(
            product: product,
           ),
        ),

        /// Content
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsHeaderRow(
                  productName: product.name,
                  price: product.price,
                  product: product,
                ),

                const SizedBox(height: 12),

                 ProductRatingRow(
                  rating: product.ratingCount.toString(),
                ),

                const SizedBox(height: 24),

                 Builddescriptionsection(
                  description:product.description ,
                ),

                const SizedBox(height: 24),

                 ProductFeaturesGrid(
                  expiration: product.expirationsMonths.toString(),
                  reviews: product.ratingCount.toString(),
                  unitAmount: product.unitAmount.toString(),
                ),

                const SizedBox(height: 32),

                const AddToCartButton(),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
