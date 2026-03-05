import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/features/home/presentation/view/HomeView.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/OfferTextBox.dart';

class OfferCard extends StatelessWidget {
  const OfferCard();

  @override
  Widget build(BuildContext context) {
     var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
           aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Image.asset(AppAssets.imagesOfferCard, fit: BoxFit.fill),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: itemWidth * .50,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        AppAssets.imagesFeaturedItemBackground,
                        fit: BoxFit.fill,
                      ),
                    ),
                   OfferTextBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
