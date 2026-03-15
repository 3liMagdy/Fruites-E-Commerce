import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/CustomTopBar.dart';
import 'package:fruits_hub/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/CartItem.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/cart_summary.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/custom_txet_conunt_cart.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          return CustomScrollView(
            slivers: [
              /// Top Bar
              SliverToBoxAdapter(
                child: CustomTopBar(
                  imageicon: AppAssets.imagesIconArrow,
                  title: AppStrings.cart,
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              SliverToBoxAdapter(
                child: CustomtxetConuntCart(count: state.items.length),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 23)),

              /// Cart Items
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = state.items[index];

                  return CartItem(product: item.product,quantity: state.items[index].quantity,);
                }, childCount: state.items.length),
              ),

             
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CartSummary(total: state.totalPrice.toString()),
                ),
              ),
            ],
          );
        }

        return const CustomTopBar(
          imageicon: AppAssets.imagesIconArrow,
          title: AppStrings.cart,
        );
      },
    );
  }
}
