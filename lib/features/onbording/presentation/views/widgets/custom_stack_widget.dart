

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

class CustomStackWidget extends StatelessWidget {
  const CustomStackWidget({super.key, required this.image, required this.backgraound});
     final String image, backgraound;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(backgraound, fit: BoxFit.fill),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(image),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(AppStrings.skip),
                ),
              ],
            ),
          );
  }
}