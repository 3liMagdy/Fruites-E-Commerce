import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustomBtn.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/EditProfileView/widgets/buildTextField_editFrom.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildtextfieldEditfrom(
          label:  AppStrings.fullName,
          isObscure:false ,
          initialValue: 'أحمد محمد'),
        const SizedBox(height: 16),
        BuildtextfieldEditfrom(label:AppStrings.email,
         initialValue: 'ahmed@example.com',
         
         ),
        const SizedBox(height: 16),
        BuildtextfieldEditfrom(
            label: AppStrings.phone, initialValue: '0123456789'),
        const SizedBox(height: 16),
        BuildtextfieldEditfrom(
            label: AppStrings.password,
            initialValue: '********', isObscure: true),
        const SizedBox(height: 40),
        CustomBtn(
          onPressed: () {},
          text: AppStrings.saveChanges,
        ),
      ],
    );
  }
}