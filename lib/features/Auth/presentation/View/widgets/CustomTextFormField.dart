import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText,
    this.suffixIcon, this.keyboardType, this.prefix, this.textDirection, this.textAlign,
    
  });
  final String labelText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final TextDirection? textDirection;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      textDirection:textDirection?? TextDirection.rtl,
      textAlign: textAlign ?? TextAlign.start,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType?? null,
      decoration: InputDecoration(
        
       prefix: prefix != null
      ? Padding(
          padding: const EdgeInsets.only(right: 8),
          child: prefix,
        )
      : null,
       
        labelText: labelText,
        labelStyle: CustomTextStyles.Cairo700style13,
        suffixIcon: suffixIcon,
        border: getBorderStyle(),
        enabledBorder: getBorderStyle(),
        focusedBorder: getBorderStyle(),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: AppColors.grey),
  );
}
