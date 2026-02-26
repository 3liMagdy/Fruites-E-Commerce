import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/Resetpassword_view/ResetpasswordView.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/forgot_password_view/ForgotPasswordView.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/signin/signin_view.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/signup/signup_view.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/varyfy_view/VaryfyView.dart';
import 'package:fruits_hub/features/onbording/presentation/manger/cubit/on_bording_cubit.dart';
import 'package:fruits_hub/features/onbording/presentation/views/view/on_bording_view.dart';
import 'package:fruits_hub/features/splash/presention/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRotuer {
  static const String ksplashRoute = '/';
  static const String kOnBordingView = '/onbording';
  static const String kAuthRoute = "/auth";
  static const String kSigninView = '/auth/signin';
 static const String kSignUpView = '/auth/signup';
  static const String kvaryfyview = '/auth/varyfy';
  static const String kForgotPasswordView = '/auth/forgotpassword';
   static const String kresetPassword = '/auth/resetPassword';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRotuer.ksplashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRotuer.kOnBordingView,
        builder: (context, state) => BlocProvider(
          create: (context) => OnBordingCubit(),
          child: const OnBordingView(),
        ),
      ),
      
      ShellRoute(
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
        path: AppRotuer.kSigninView,
        builder: (context, state) => const SigninView(),
      ),
       GoRoute(
        path: AppRotuer.kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRotuer.kForgotPasswordView,
        builder: (context, state) => const Forgotpasswordview(),
      ),
       GoRoute(
        path: AppRotuer.kvaryfyview,
        builder: (context, state) => const VaryfyView(),
      ),
      GoRoute(
        path: AppRotuer.kresetPassword,
        builder: (context, state) => const Resetpasswordview(),
      ),
        ]
      ),
    ],
  );
}
