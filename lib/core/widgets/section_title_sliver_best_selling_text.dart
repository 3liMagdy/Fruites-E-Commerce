import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/SectionBestSellingText.dart';

class SectionTitleSliverBestSellingText extends StatelessWidget {
  const SectionTitleSliverBestSellingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SectionBestSellingText(),
          ),
          SizedBox(height:16),
        ],
      ),
    );
  }
}