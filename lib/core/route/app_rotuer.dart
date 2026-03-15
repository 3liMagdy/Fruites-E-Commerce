import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/app_cubit/app_cubit.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/Resetpassword_view/ResetpasswordView.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/forgot_password_view/ForgotPasswordView.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/signin/signin_view.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/signup/signup_view.dart';
import 'package:fruits_hub/features/Auth/presentation/View/view/varyfy_view/VaryfyView.dart';
import 'package:fruits_hub/features/home/presentation/view/HomeView.dart';
import 'package:fruits_hub/features/onbording/presentation/manger/cubit/on_bording_cubit.dart';
import 'package:fruits_hub/features/onbording/presentation/views/view/on_bording_view.dart';
import 'package:fruits_hub/features/home/presentation/view/MainView.dart';
import 'package:fruits_hub/features/product_details/presentation/view/ProductDetailsView.dart';
import 'package:fruits_hub/features/products/presentation/view/ProductsView.dart';
import 'package:fruits_hub/features/cart/presentation/view/CartView.dart';
import 'package:fruits_hub/features/checkout/presentation/view/CheckoutView.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/ProfileView/ProfileView.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/EditProfileView/EditProfileView.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/OrdersView/OrdersView.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/PaymentMethodsView/PaymentMethodsView.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/PaymentMethodsView/widgets/AddPaymentMethodView.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/FavoritesView/FavoritesView.dart';
import 'package:fruits_hub/features/profile/presentation/view/AboutUsView.dart';
import 'package:fruits_hub/features/search/presentation/view/SearchView.dart';
import 'package:go_router/go_router.dart';

class AppRotuer {
  static const String kOnBordingView = '/onbording';
  static const String kSigninView = '/auth/signin';
  static const String kSignUpView = '/auth/signup';
  static const String kvaryfyview = '/auth/varyfy';
  static const String kForgotPasswordView = '/auth/forgotpassword';
  static const String kresetPassword = '/auth/resetPassword';
  static const String kHomeRoute = '/home';
  static const String kProductsView = '/products';
  static const String kCartView = '/cart';
  static const String kProfileView = '/profile';
  static const String kProductDetailsView = '/productDetails';
  static const String kCheckoutView = '/checkout';
  static const String kEditProfileView = '/editProfile';
  static const String kOrdersView = '/orders';
  static const String kPaymentMethodsView = '/paymentMethods';
  static const String kAddPaymentMethodView = '/addPaymentMethod';
  static const String kFavoritesView = '/favorites';
  static const String kAboutUsView = '/aboutUs';
  static const String kSearchView = '/search';

  static GoRouter router(BuildContext context) {
    final appCubit = context.read<AppCubit>();

    return GoRouter(
      initialLocation: kSigninView,
      redirect: (context, state) {
        final appState = appCubit.state;
        final isAuthRoute = state.fullPath?.startsWith('/auth') ?? false;

        if (appState is AppUnauthenticated) {
          if (!isAuthRoute && state.fullPath != kOnBordingView) {
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
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainView(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: kHomeRoute,
                  builder: (context, state) => const HomeView(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: kCartView,
                  builder: (context, state) => const CartView(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: kProductsView,
                  builder: (context, state) => const ProductsView(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: kProfileView,
                  builder: (context, state) => const ProfileView(),
                ),
              ],
            ),
          ],
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
          builder: (context, state) => const Forgotpasswordview(),
        ),
        GoRoute(
          path: kvaryfyview,
          builder: (context, state) => const VaryfyView(),
        ),
        GoRoute(
          path: kresetPassword,
          builder: (context, state) => const Resetpasswordview(),
        ),
        GoRoute(
          path: kProductDetailsView,
          builder: (context, state) {
            final product = state.extra as ProductEntity;
            return ProductDetailsView(product: product);
          },
        ),
        GoRoute(
          path: kCheckoutView,
          builder: (context, state) => const CheckoutView(),
        ),
        GoRoute(
          path: kEditProfileView,
          builder: (context, state) => const EditProfileView(),
        ),
        GoRoute(
          path: kOrdersView,
          builder: (context, state) => const OrdersView(),
        ),
        GoRoute(
          path: kPaymentMethodsView,
          builder: (context, state) => const PaymentMethodsView(),
        ),
        GoRoute(
          path: kAddPaymentMethodView,
          builder: (context, state) => const AddPaymentMethodView(),
        ),
        GoRoute(
          path: kFavoritesView,
          builder: (context, state) => const FavoritesView(),
        ),
        GoRoute(
          path: kAboutUsView,
          builder: (context, state) => const AboutUsView(),
        ),
        GoRoute(
          path: kSearchView,
          builder: (context, state) => const Searchview(),
        ),
      ],
    );
  }
}
