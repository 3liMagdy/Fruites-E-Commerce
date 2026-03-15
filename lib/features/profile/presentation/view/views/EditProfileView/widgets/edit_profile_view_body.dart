import 'package:flutter/material.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/EditProfileView/widgets/edit_profile_form.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/EditProfileView/widgets/edit_profile_image.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          EditProfileImage(),
          SizedBox(height: 32),
          EditProfileForm(),
        ],
      ),
    );
  }
}
