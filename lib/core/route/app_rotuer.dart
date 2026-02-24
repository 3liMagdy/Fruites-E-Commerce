import 'package:fruits_hub/features/onbording/presentation/views/view/on_bording_view.dart';
import 'package:fruits_hub/features/splash/presention/views/splash_view.dart';
import 'package:go_router/go_router.dart';


 class AppRotuer {
  static const String ksplashRoute = '/';
   static const String kOnBordingView = '/onbording';

  static final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRotuer.ksplashRoute,
      builder: (context, state) => const SplashView(),
    ),
     GoRoute(
      path: AppRotuer.kOnBordingView,
      builder: (context, state) => const OnBordingView(),
    ),
  ],
);
}


