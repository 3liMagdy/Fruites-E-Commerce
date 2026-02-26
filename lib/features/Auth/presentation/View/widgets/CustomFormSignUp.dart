


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomForgotPasswordText.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextSpan.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/OrDivider.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/SocialLoginButton.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/TermsAndConditionsWidget.dart';

class CustomformfieldSignUp extends StatelessWidget {
  const CustomformfieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(labelText: AuthStrings.fullNameHint),

            SizedBox(height: 16),
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
            TermsAndConditionsWidget(),
            
            SizedBox(height: 30),

            CustonBtn(text: AuthStrings.loginButton, onpressed: () {}),
            SizedBox(height: 26),
               CustomTextSpan(text1:AuthStrings.alreadyHaveAccount,text2: AuthStrings.loginNow,),
            
            
           
            
  
          ],
        ),
      ),
    );
  }
}

