import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/app_cubit/app_cubit.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/Resetpassword_view/ResetpasswordView.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/forgot_password_view/ForgotPasswordView.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/signin/signin_view.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/signup/signup_view.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/varyfy_view/VaryfyView.dart';
import 'package:fruits_hub/features/home/presentation/view/HomeView.dart';
import 'package:fruits_hub/features/onbording/presentation/manger/cubit/on_bording_cubit.dart';
import 'package:fruits_hub/features/onbording/presentation/views/view/on_bording_view.dart';
import 'package:go_router/go_router.dart';

class AppRotuer {
  static const String kOnBordingView = '/onbording';
  static const String kSigninView = '/auth/signin';
  static const String kSignUpView = '/auth/signup';
  static const String kvaryfyview = '/auth/varyfy';
  static const String kForgotPasswordView = '/auth/forgotpassword';
  static const String kresetPassword = '/auth/resetPassword';
  static const String kHomeRoute = '/home';

  static GoRouter router(BuildContext context) {
    final appCubit = context.read<AppCubit>();

    return GoRouter(
      initialLocation: kSigninView, // مش مهم قوي لأن redirect هيتحكم

      redirect: (context, state) {
        final appState = appCubit.state;

        final isAuthRoute =
            state.fullPath?.startsWith('/auth') ?? false;

        if (appState is AppUnauthenticated) {
          if (!isAuthRoute) {
            return kSigninView;
          }
        }

        if (appState is AppAuthenticated) {
          if (isAuthRoute) {
            return kHomeRoute;
          }
        }

        return null;
      },

      routes: [
        GoRoute(
          path: kHomeRoute,
          builder: (context, state) => const Homeview(),
        ),

        GoRoute(
          path: kOnBordingView,
          builder: (context, state) => BlocProvider(
            create: (_) => OnBordingCubit(),
            child: const OnBordingView(),
          ),
        ),

       
        GoRoute(
          path: kSigninView,
          builder: (context, state) => const SigninView(),
        ),
        GoRoute(
          path: kSignUpView,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: kForgotPasswordView,
          builder: (context, state) =>
              const Forgotpasswordview(),
        ),
        GoRoute(
          path: kvaryfyview,
          builder: (context, state) => const VaryfyView(),
        ),
        GoRoute(
          path: kresetPassword,
          builder: (context, state) =>
              const Resetpasswordview(),
        ),
      ],
    );
  }
}