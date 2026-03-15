import 'package:flutter/material.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomFormResetPassword.dart';

import '../../../../../core/widgets/CustomTopBar.dart';

class ResetpasswordviewBody extends StatelessWidget {
  const ResetpasswordviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            CustomTopBar(title: AuthStrings.newPasswordHint, imageicon: AppAssets.imagesIconArrow,),
            SizedBox(height: 28),
            Expanded(
              child: Text(
                AuthStrings.resetPasswordTitle,
                style: CustomTextStyles.Cairo600style16.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 34),
            CustomFormResetPassword(),
          ]),
        ),
      ],
    );
  }
}
