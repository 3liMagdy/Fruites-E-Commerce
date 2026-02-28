


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_constant.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/OtpInputVerifyAccount.dart';
import 'package:pinput/pinput.dart';

class OtpWidgetBody extends StatelessWidget {
   OtpWidgetBody({
    super.key,
    required this.defaultPinTheme,
    required this.focusedPinTheme,
    required this.onCompleted,
  });

  final PinTheme defaultPinTheme;
  final PinTheme focusedPinTheme;
  void Function(String) onCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: OtpInputVerifyAccount(
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          separatorWidth: fieldSpacing,
          onCompleted:onCompleted ,
        ),
      ),
    );
  }
}