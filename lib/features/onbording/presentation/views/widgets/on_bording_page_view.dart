import 'package:flutter/material.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/custom_box_deccrption.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/custom_stack_widget.dart';

class OnBordingPageViewItem extends StatelessWidget {
  const OnBordingPageViewItem({
    super.key,
    required this.title,
    required this.subtitle, required this.image, required this.backgraound, required this.color,
  });
 final String image, backgraound;
  final String subtitle;
  final Widget title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
          flex: 5,
          child: CustomStackWidget(
            backgraound: backgraound,
            image: image,
            color: color,
          ),
        ),
       SizedBox(height: 47),
        Expanded(
          flex: 2,
          child: CustomBoxDeccrption(
            subtitle: subtitle,
            title: title,
          ),
        ),
          
        ],
      ),
    );
  }
}




