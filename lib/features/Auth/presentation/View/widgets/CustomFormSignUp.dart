import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/functions/showToast.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/widgets/CustomBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextSpan.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/TermsAndConditionsWidget.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';

class CustomformfieldSignUp extends StatefulWidget {
  CustomformfieldSignUp({super.key});

  @override
  State<CustomformfieldSignUp> createState() => _CustomformfieldSignUpState();
}

class _CustomformfieldSignUpState extends State<CustomformfieldSignUp> {
  late TextEditingController emailcontroller;

  late TextEditingController passwordcontroller;

  late TextEditingController namecontroller;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool obscureText = true;
   bool isCheck = false;

  @override
  void initState() {
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    namecontroller = TextEditingController();
    super.initState();
  }

  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
         if (state is AuthFuiledState) {
          customshowToast(state.errormessage, Colors.red);
        }
        else if (state is AuthSuccessState) {
          customshowToast(AuthStrings.showToastSuccessSignUp, AppColors.primaryColor);
          customNavigatepushReplacement(context, AppRotuer.kHomeRoute);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 24),
                CustomTextFormField(
                  controller: namecontroller,
                  labelText: AuthStrings.fullNameHint,
                ),

                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: AuthStrings.emailHint,
                  controller: emailcontroller,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  obscureText: obscureText,
                  controller: passwordcontroller,
                  labelText: AuthStrings.passwordHint,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: (obscureText)
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(height: 16),
                TermsAndConditionsWidget(
                  isCheck: isCheck,
                  onChanged: (newValue) {
                    setState(() {
                      isCheck = newValue ?? false;
                    });
                  },
                ),

                SizedBox(height: 30),

                CustomBtn(
                  text: AuthStrings.signUpButton,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      if(isCheck){
                        context.read<AuthCubit>().signUp(
                        email: emailcontroller.text,
                        password: passwordcontroller.text,
                        name: namecontroller.text
                     );
                      }else{
                        customshowToast(AuthStrings.pleaseAcceptTermsAndConditions, Colors.red);
                      }
                     
                    }
                  },
                ),
                SizedBox(height: 26),
                CustomTextSpan(
                  text1: AuthStrings.alreadyHaveAccount,
                  text2: AuthStrings.loginNow,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
