import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/database/cache/cacheKeys.dart';
import 'package:fruits_hub/core/database/cache/cache_helper.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:go_router/go_router.dart';

class SplaahViewBody extends StatefulWidget {
  const SplaahViewBody({super.key});

  @override
  State<SplaahViewBody> createState() => _SplaahViewBodyState();
}

class _SplaahViewBodyState extends State<SplaahViewBody> {
  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkOnBoarding();
    });
    super.initState();
  }



    Future<void> _checkOnBoarding() async {
    await Future.delayed(const Duration(seconds: 2));

    final visited = getIt<CacheHelper>()
      .getBool(key: CacheKeys.onBoardingVisited);

     if (!mounted) return;

    // Use GoRouter's `go` to replace the stack.
    if (visited) {
       customNavigatepushReplacement(context, AppRotuer.kSigninView);

    } else {
      customNavigatepushReplacement(context, AppRotuer.kOnBordingView);

    }
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




