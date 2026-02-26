



import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomFormSignUp.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTopBar.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            CustomTopBar(title: AuthStrings.createAccountTitle),
            CustomformfieldSignUp(),
            
          ]),
        ),
      ],

    );
     }
}