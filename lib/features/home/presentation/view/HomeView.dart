import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/BottomNavBar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/HomeHeader.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/LilstOfferCard.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/ListProducts.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/OfferCard.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/SearchBar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/SectionHeader.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      bottomNavigationBar:  Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavBar(currentIndex: 3,onTap: (currentIndex){},)),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: SizedBox(height: 20)),
            ),

            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: HomeHeader(),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomSearchBar(),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: ListOfferCard()),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: SectionHeader()),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: ListProducts(),
            ),
          ],
        ),
      ),
    );
  }
}
