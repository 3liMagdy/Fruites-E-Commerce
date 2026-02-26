


import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_constant.dart';
import 'package:pinput/pinput.dart';


PinTheme CustomPinTheme(double fieldWidth, TextStyle pinTextStyle) {
      final defaultPinTheme = PinTheme(
      width: fieldWidth,
      height: fieldHeight,
      textStyle: pinTextStyle,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return defaultPinTheme;
  }

