



import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomFormSignUp.dart';

import '../../../../../core/widgets/CustomTopBar.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            CustomTopBar(title: AuthStrings.createAccountTitle, imageicon:  AppAssets.imagesIconArrow),
            CustomformfieldSignUp(),
            
          ]),
        ),
      ],

    );
     }
}