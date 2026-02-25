import 'package:flutter/material.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/custom_box_deccrption.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/custom_stack_widget.dart';

class OnBordingPageViewItem extends StatelessWidget {
  const OnBordingPageViewItem({
    super.key,
    required this.title,
    required this.subtitle, required this.image, required this.backgraound,
  });
 final String image, backgraound;
  final String subtitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomStackWidget(backgraound:backgraound ,image:image ,),
          SizedBox(height: 47.5),
          CustomBoxDeccrption(subtitle: subtitle,title:title ,),
        ],
      ),
    );
  }
}




