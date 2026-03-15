import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/product_details/presentation/view/widgets/BottomCurveClipperImage.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.image});
  final String image ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ClipPath(
          clipper: BottomCurveClipperImage(),
          child: Container(
            width: double.infinity,
            color: AppColors.lighterGrey,
            padding: const EdgeInsets.only(top: 20, bottom: 60),
            child: Hero(
              tag: 'product_image',
              child: Image.network(
                image,
                fit: BoxFit.contain,
                height: height*0.4,
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 30,
          
          child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppAssets.imagesArrowBackInProductDetiles),
              ),
            ),
        ),
      ],
    );
  }
}


