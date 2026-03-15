import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';

import 'package:flutter/material.dart';
import 'package:fruits_hub/features/search/presentation/view/widgets/SearchResultsHeader.dart';
import 'package:fruits_hub/features/search/presentation/view/widgets/search_results_header.dart';

class ResultsHeaderSliver extends StatelessWidget {
  const ResultsHeaderSliver({
    super.key,
    required this.resultsCount,
  });

  final int resultsCount;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SearchResultsHeader(resultsCount: resultsCount),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}