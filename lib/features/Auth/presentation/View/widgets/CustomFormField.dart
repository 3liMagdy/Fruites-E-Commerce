import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomForgotPasswordText.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextSpan.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/OrDivider.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/SocialLoginButton.dart';

class Customformfield extends StatelessWidget {
  const Customformfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(labelText: AuthStrings.emailHint),
            SizedBox(height: 16),
            CustomTextFormField(
              labelText: AuthStrings.passwordHint,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomForgotPasswordText()),
            SizedBox(height: 33),
            CustonBtn(text: AuthStrings.loginButton, onpressed: () {}),
            SizedBox(height: 33),
            CustomTextSpan(),
            SizedBox(height: 37),
            OrDivider(),
            SizedBox(height: 37),
            SocialLoginButton(
              text: AuthStrings.continueWithGoogle,
              icon: SvgPicture.asset(AppAssets.AppAssetsImagesGoogleIcon),
              onTap: () {},
            ),
             SizedBox(height: 16),
             SocialLoginButton(
              text: AuthStrings.continueWithApple,
              icon: SvgPicture.asset(AppAssets.AppAssetsImagesApplIcon),
              onTap: () {},
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              text: AuthStrings.continueWithFacebook,
             icon: SvgPicture.asset(AppAssets.AppAssetsImagesFacebookIcon),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}













