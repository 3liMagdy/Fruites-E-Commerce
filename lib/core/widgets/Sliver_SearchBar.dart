




import 'package:flutter/material.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/widgets/SearchBar.dart';

class SearchBarSliver extends StatelessWidget {
  const SearchBarSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomSearchBar(
            onTap: () {
              customNavigate(context, AppRotuer.kSearchView);
            },
          ),
        ),
      ),
    );
  }
}