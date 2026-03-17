import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustomTopBar.dart';
import 'package:fruits_hub/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/cart_summary.dart';
import 'package:fruits_hub/features/cart/presentation/view/widgets/custom_cart_count_text.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// Static Top Bar
        const SliverToBoxAdapter(
          child: CustomTopBar(
            imageicon: AppAssets.imagesIconArrow,
            title: AppStrings.cart,
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 16)),

        /// Dynamic Item Count
        SliverToBoxAdapter(
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              int count = 0;
              if (state is CartUpdated) {
                count = state.cartEntity.items.length;
              }
              return CustomCartCountText(count: count);
            },
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 23)),

        /// Dynamic Cart Items List
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is CartEmpty) {
              return const SliverToBoxAdapter(
                child: Center(child: Text("Cart is empty")),
              );
            } else if (state is CartError) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.message)),
              );
            } else if (state is CartUpdated) {
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = state.cartEntity.items[index];
                  return CartItemWidget(
                    product: item.product,
                    quantity: item.quantity,
                  );
                }, childCount: state.cartEntity.items.length),
              );
            }

            return const SliverToBoxAdapter(child: SizedBox());
          },
        ),

        /// Dynamic Summary Bottom Bar
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            num total = 0;
            if (state is CartUpdated) {
              total = state.cartEntity.totalPrice;
            }
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CartSummary(total: total.toStringAsFixed(2)),
              ),
            );
          },
        ),
      ],
    );
  }
}
