import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_state.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/products/presentation/view/widgets/CategoryItem.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
 
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if(state is ProductsLoaded){
           return SizedBox(
               height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CategoryItem(
                        title: product.name,
                        image: product.imageUrl ?? '',
                      ),
                    );
                  },
                ),
              );
        }else if(state is ProductsFailure ){
          return Center(
            child: Text(
              state.message,
              style: CustomTextStyles.Cairo600style13.copyWith(color: Colors.red),
            ),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
       
      },
    );
  }
}



