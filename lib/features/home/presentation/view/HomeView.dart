import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/HomeViewBody.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
      customNavigatepushReplacement( context, AppRotuer.kSigninView);
       }
      },
      child: Scaffold(body: HomeViewBody()),
    );
  }
}
