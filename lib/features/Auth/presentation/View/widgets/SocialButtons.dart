

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/SocialLoginButton.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';

class Socialbuttons extends StatelessWidget {
  const Socialbuttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, ),
      child: Column(
        children: [
           SocialLoginButton(
                text: AuthStrings.continueWithGoogle,
                icon: SvgPicture.asset(AppAssets.AppAssetsImagesGoogleIcon),
                onTap: () {
                  context.read<AuthCubit>().signInWithGoogle();
                },
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
                onTap: () {
                  context.read<AuthCubit>().signInWithFacebook();
                },
              ),
        ],
      ),
    );
  }
}