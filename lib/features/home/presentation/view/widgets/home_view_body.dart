

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/Sliver_SearchBar.dart';
import 'package:fruits_hub/core/widgets/section_title_sliver_best_selling_text.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/HomeHeader.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/LilstOfferCard.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/ListProducts.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
         SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(child: Directionality(
            textDirection: TextDirection.ltr,
            child: HomeHeader())),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
       const SearchBarSliver(),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(child: ListOfferCard()),
        ),     
      const  SectionTitleSliverBestSellingText(),
       
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: ListProducts(),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}
