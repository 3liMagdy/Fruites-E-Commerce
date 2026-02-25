import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/signin/signin_view.dart';
import 'package:fruits_hub/features/onbording/presentation/manger/cubit/on_bording_cubit.dart';
import 'package:fruits_hub/features/onbording/presentation/views/view/on_bording_view.dart';
import 'package:fruits_hub/features/splash/presention/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRotuer {
  static const String ksplashRoute = '/';
  static const String kOnBordingView = '/onbording';
  static const String kSigninView = '/signin';

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
      GoRoute(
        path: AppRotuer.kSigninView,
        builder: (context, state) => const SigninView(),
      ),
    ],
  );
}
