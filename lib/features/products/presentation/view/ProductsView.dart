import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/CustomTopBar.dart';
import 'package:fruits_hub/core/widgets/Sliver_SearchBar.dart';
import 'package:fruits_hub/core/widgets/section_title_sliver_best_selling_text.dart';
import 'package:fruits_hub/features/products/presentation/view/widgets/ProductGridSliverCubit..dart';
import 'package:fruits_hub/features/products/presentation/view/widgets/categories_sliver.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..getProducts(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CustomTopBar(
                imageicon: AppAssets.imagesIconArrow,
                title: AppStrings.products,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            const SearchBarSliver(),
            SectionProductsTextWithFliter(),
            const CategoriesSliver(),

            const SectionTitleSliverBestSellingText(),

            ProductGridSliverCubit(),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}






class SectionProductsTextWithFliter extends StatelessWidget {
  const SectionProductsTextWithFliter();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        sliver:SliverToBoxAdapter(
         child: Row(
        children: [
          Text(
            AppStrings.haveproducts,
            style: CustomTextStyles.Cairo700style19.copyWith(color: AppColors.black),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppAssets.imagesFilter2),
          ),
        ],
      ),
        ),
      
    );
  }
}
