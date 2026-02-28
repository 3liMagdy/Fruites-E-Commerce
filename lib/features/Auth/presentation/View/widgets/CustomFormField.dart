import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/assets/app_assets.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/functions/showToast.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/Auth_strings.dart';
import 'package:fruits_hub/core/widgets/CustonBtn.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomForgotPasswordText.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextFormField.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/CustomTextSpan.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/OrDivider.dart';
import 'package:fruits_hub/features/Auth/presentation/View/widgets/SocialLoginButton.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';

class Customformfield extends StatefulWidget {
  Customformfield({super.key});

  @override
  State<Customformfield> createState() => _CustomformfieldState();
}

class _CustomformfieldState extends State<Customformfield> {
  late final TextEditingController emailcontroller ;

  late final TextEditingController passwordcontroller;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
 bool isVisible =false;

@override
  void initState() {
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
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
          customshowToast(AuthStrings.showToastSuccess, AppColors.primaryColor);
          customNavigatepushReplacement(context, AppRotuer.kHomeRoute);
        }
      },
       builder: (BuildContext context, AuthState state) { 
        return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
         
          key:formkey,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                labelText: AuthStrings.emailHint,
                controller: emailcontroller,
               
              ),

              SizedBox(height: 16),
              CustomTextFormField(
                obscureText: isVisible,
                labelText: AuthStrings.passwordHint,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible =!isVisible;
                    });
                  },
                  icon:(isVisible)? Icon(Icons.visibility):Icon(Icons.visibility_off),
                ),
                controller: passwordcontroller,
              ),
              SizedBox(height: 16),

              Align(
                alignment: Alignment.centerLeft,
                child: CustomForgotPasswordText(
                  onTap: () {           
                    customNavigate(context, AppRotuer.kForgotPasswordView);
                  },
                ),
              ),
              SizedBox(height: 33),

             (state is AuthLoadingState)
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustonBtn(
                      text: AuthStrings.loginButton,
                      onpressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AuthCubit>().signInwithEmailAndPassword(
                          email: emailcontroller.text,
                          password: passwordcontroller.text,
                        );
                        }
                        
                      },
                    ),
              SizedBox(height: 33),

              CustomTextSpan(
                text1: AuthStrings.dontHaveAccount,
                text2: AuthStrings.createAccountTitle,
                onTap: () {
                  customNavigate(context, AppRotuer.kSignUpView);
                },
              ),
              SizedBox(height: 37),
              OrDivider(),
              SizedBox(height: 37),
            ],
          ),
        ),
      ); 
       },
     
    );
  }
}
