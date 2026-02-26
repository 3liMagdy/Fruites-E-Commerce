import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTopBar.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/SignInViewBody.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Signinviewbody() , 
      );
  }
}


