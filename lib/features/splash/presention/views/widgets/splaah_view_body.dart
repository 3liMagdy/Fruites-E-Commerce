import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:go_router/go_router.dart';

class SplaahViewBody extends StatefulWidget {
  const SplaahViewBody({super.key});

  @override
  State<SplaahViewBody> createState() => _SplaahViewBodyState();
}

class _SplaahViewBodyState extends State<SplaahViewBody> {
  @override
  void initState() {
    excutInit(context, AppRotuer.kOnBordingView);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(AppAssets.AppAssetsImagesPlant),
        ),
        SvgPicture.asset(AppAssets.AppAssetsImagesLogo),
        SvgPicture.asset(
          AppAssets.AppAssetsImagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}

void excutInit(context, String path){
 customNavigatepushReplacement(context, path);
}


