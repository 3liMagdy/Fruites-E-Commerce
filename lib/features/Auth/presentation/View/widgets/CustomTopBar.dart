import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/widgets/custom_title.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.123,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  AppAssets.AppAssetsImagesArrow,
                  height: 18,
                  width: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomTitle(title: title),
          ),
        ],
      ),
    );
  }
}
