



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_state.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/products_grid_sliver.dart';

class ProductGridSliverCubit extends StatelessWidget {
  const ProductGridSliverCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {

        if (state is ProductsLoaded) {
          return ProductsGridSliver(products: state.products);
        }

        else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.message,
                style: CustomTextStyles.Cairo600style13
                    .copyWith(color: Colors.red),
              ),
            ),
          );
        }

        else {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          );
        }
      },
    );
  }
}
