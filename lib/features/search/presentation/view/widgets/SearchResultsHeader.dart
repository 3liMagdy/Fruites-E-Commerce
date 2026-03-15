import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';

class SearchResultsHeader extends StatelessWidget {
  const SearchResultsHeader({
    super.key,
    required this.resultsCount,
  });

  final int resultsCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.searchResults,
            style: CustomTextStyles.Cairo600style16
                .copyWith(color: AppColors.black),
          ),

          Text(
            '$resultsCount ${AppStrings.searchResults}',
            style: CustomTextStyles.Cairo400style13
                .copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}