import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomformfieldForgotPassword.dart';

import '../../../../../core/widgets/CustomTopBar.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            CustomTopBar(title: AuthStrings.forgotPasswordTitle, imageicon: AppAssets.imagesIconArrow,),
            SizedBox(height: 28),
            Expanded(
              child: Text(
                AuthStrings.forgotPasswordDescription,
                style: CustomTextStyles.Cairo600style16,
              ),
            ),
            SizedBox(height: 31),
            CustomformfieldForgotPassword(),
          ]),
        ),
      ],
    );
  }
}
