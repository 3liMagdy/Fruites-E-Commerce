


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/widgets/custom_title.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key, required this.title, required this.imageicon,  this.icon, this.isProduct});

  final String title;
 final String imageicon;
 final bool? isProduct;
 final Widget? icon;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.123,
      child: Stack(
        children: [
          Align(
            alignment:(isProduct != null) ?Alignment.bottomLeft :Alignment.bottomRight,
            child: GestureDetector(
              
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child:(icon!=null)  ? icon! : SvgPicture.asset(
                  imageicon,
                  height: 18,
                  width: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomTitle(title: title),
            ),
          ),
        ],
      ),
    );
  }
}