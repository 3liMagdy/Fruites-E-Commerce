


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextSpan.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        Expanded(
          child: CustomTextSpan(
            text1: AuthStrings.agreeToTermsPrefix,
             text2: AuthStrings.termsAndConditions,
             textAlign: TextAlign.start,
             ),
        )
      ],
    );
  }
}