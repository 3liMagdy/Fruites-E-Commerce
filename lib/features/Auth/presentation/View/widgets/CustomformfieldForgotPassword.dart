import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/functions/showToast.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';

class CustomformfieldForgotPassword extends StatefulWidget {
  CustomformfieldForgotPassword({super.key});

  @override
  State<CustomformfieldForgotPassword> createState() =>
      _CustomformfieldForgotPasswordState();
}

class _CustomformfieldForgotPasswordState
    extends State<CustomformfieldForgotPassword> {
  late TextEditingController phonecontroller;
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phonecontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFuiledState) {
          customshowToast(state.errormessage, Colors.red);
        }else if (state is AuthCodeSent) {
          customshowToast(AuthStrings.showToastSuccess, AppColors.primaryColor);
          customNavigate(context, AppRotuer.kvaryfyview);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextFormField(
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},

                    controller: phonecontroller,
                    labelText: AuthStrings.phoneNumberHint,
                    keyboardType: TextInputType.phone,
                    prefix: Text(AppStrings.phoneCountry),
                  ),
                ),
                SizedBox(height: 30),
                CustonBtn(
                  text: AuthStrings.sendPasswordResetButton,
                  onpressed: () {
                    context.read<AuthCubit>().verifyPhone(phonecontroller.text);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
