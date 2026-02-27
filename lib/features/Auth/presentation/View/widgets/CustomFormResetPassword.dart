

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';

class CustomFormResetPassword extends StatelessWidget {
   CustomFormResetPassword({super.key});
 TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child:Column(
        children: [
           CustomTextFormField(
            controller: newpasswordcontroller,
              labelText: AuthStrings.createNewPasswordhint,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility_off),
              ),
              
            ),
            SizedBox(height: 24),
             CustomTextFormField(
              controller: confirmpasswordcontroller,
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