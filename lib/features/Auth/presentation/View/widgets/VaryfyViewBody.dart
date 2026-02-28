import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/CustomPinTheme.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/functions/showToast.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_constant.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTopBar.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/OtpWidgetBody.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:pinput/pinput.dart';

class VaryfyViewBody extends StatefulWidget {
  const VaryfyViewBody({super.key});

  @override
  State<VaryfyViewBody> createState() => _VaryfyViewBodyState();
}

class _VaryfyViewBodyState extends State<VaryfyViewBody> {
  String otpCode = '';
  @override
  Widget build(BuildContext context) {
    final pinTextStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFuiledState) {
          customshowToast(state.errormessage, Colors.red);
        }

        if (state is AuthOtpVerified) {
          customNavigate(context, AppRotuer.kresetPassword);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomTopBar(title: AuthStrings.verificationCodeTitle),

              SizedBox(height: 28),

              Text(
                AuthStrings.verificationCodeDescription,
                style: CustomTextStyles.Cairo600style16,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 31),

              LayoutBuilder(
                builder: (context, constraints) {
                  final fieldWidth =
                      (constraints.maxWidth - (fieldSpacing * 3)) / 6;
                  PinTheme defaultPinTheme = CustomPinTheme(
                    fieldWidth,
                    pinTextStyle,
                  );
                  final focusedPinTheme = defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: AppColors.orange),
                    ),
                  );
                  return OtpWidgetBody(
                    onCompleted: (value) {
                      otpCode = value;
                    },
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                  );
                },
              ),
              SizedBox(height: 29),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustonBtn(
                  onpressed: () {
                    if (otpCode.length ==6 ) {
                      context.read<AuthCubit>().verifyOtp(smsCode: otpCode);
                    }
                  },
                  text: AuthStrings.verifyCodeButton,
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {},
                child: Text(
                  AuthStrings.resendCode,
                  style: CustomTextStyles.Cairo600style16.copyWith(
                    color: AppColors.green600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
