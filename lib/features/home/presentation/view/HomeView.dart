import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub/core/utils/app_styles.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..getBestSellingProducts(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: const SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
