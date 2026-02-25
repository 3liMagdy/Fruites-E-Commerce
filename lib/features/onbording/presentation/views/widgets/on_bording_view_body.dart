import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/navigation.dart';
import 'package:fruits_hub/core/route/app_rotuer.dart';
import 'package:fruits_hub/features/onbording/presentation/manger/cubit/on_bording_cubit.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/CustomDots.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/PageViewBody.dart';
import 'package:fruits_hub/features/onbording/presentation/views/widgets/VisibilityButton.dart';

class OnBordingViewBody extends StatelessWidget {
   const OnBordingViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBordingCubit>();
    return BlocListener<OnBordingCubit, OnBordingState>(
      listener: (context, state) {
        if (state.status == OnBordingStatus.success) {
          customNavigatepushReplacement(context, AppRotuer.kSigninView);
        }
      },
      child: BlocBuilder<OnBordingCubit, OnBordingState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageviewBody(
                  onPageChanged: cubit.onPageChanged,
                  controller: cubit.pageController,
                ),
              ),
              CustomDots(controller: cubit.pageController),
              const SizedBox(height: 29),
              VisibilityButton(
                isVisible: state.pageIndex == 1,
                onpressed: cubit.getStarted,
              ),
            ],
          );
        },
      ),
    );
  }
}
