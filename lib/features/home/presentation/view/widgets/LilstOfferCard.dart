


import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/OfferCard.dart';
class ListOfferCard extends StatelessWidget {
  const ListOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(left: 8),
            child: OfferCard(),
          );
        },
      ),
    );
  }
}