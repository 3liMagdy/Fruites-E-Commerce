import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/functions/showToast.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/widgets/CustomBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';

class CustomFormResetPassword extends StatefulWidget {
  CustomFormResetPassword({super.key});

  @override
  State<CustomFormResetPassword> createState() =>
      _CustomFormResetPasswordState();
}

class _CustomFormResetPasswordState extends State<CustomFormResetPassword> {
  TextEditingController newpasswordcontroller = TextEditingController();

  TextEditingController confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFuiledState) {
          customshowToast(state.errormessage, Colors.red);
        }

        if (state is AuthPasswordUpdated) {
          customshowToast("تم تغيير كلمة المرور بنجاح", AppColors.primaryColor);
        
          customNavigate(context, AppRotuer.kSigninView);
            context.read<AuthCubit>().resetState();
        }
      },
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              CustomTextFormField(
                controller: newpasswordcontroller,
                labelText: AuthStrings.createNewPasswordhint,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                controller: confirmpasswordcontroller,
                labelText: AuthStrings.confirmNewPasswordHint,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 24),
              CustomBtn(
                text: AuthStrings.createNewPasswordbutton,
                onPressed: () {
                  if (newpasswordcontroller.text ==
                      confirmpasswordcontroller.text) {
                    context.read<AuthCubit>().updatePassword(
                      newpasswordcontroller.text,
                    );
                  } else {
                    customshowToast("كلمتا المرور غير متطابقتين", Colors.red);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
