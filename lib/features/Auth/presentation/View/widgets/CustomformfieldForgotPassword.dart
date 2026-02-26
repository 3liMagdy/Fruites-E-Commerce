import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';

class CustomformfieldForgotPassword extends StatelessWidget {
  const CustomformfieldForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.ltr ,
              child: CustomTextFormField(
                labelText: AuthStrings.phoneNumberHint,
                keyboardType: TextInputType.phone,
                prefix:Text(AppStrings.phoneCountry),
                
                ),
            ),
            SizedBox(height: 30),
            CustonBtn(
              text: AuthStrings.sendPasswordResetButton,
              onpressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
