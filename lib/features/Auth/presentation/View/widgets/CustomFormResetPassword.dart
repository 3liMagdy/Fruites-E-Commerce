

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';

class CustomFormResetPassword extends StatelessWidget {
  const CustomFormResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child:Column(
        children: [
           CustomTextFormField(
              labelText: AuthStrings.createNewPasswordhint,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility_off),
              ),
              
            ),
            SizedBox(height: 24),
             CustomTextFormField(
              labelText: AuthStrings.confirmNewPasswordHint,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility_off),
              ),
              
            ),
             SizedBox(height: 24),
            CustonBtn(text: AuthStrings.createNewPasswordbutton, onpressed: () {}),
        ],
      ) ,
       );
  }
}