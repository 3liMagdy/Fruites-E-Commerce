import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/onbording/presentation/manger/cubit/on_bording_cubit.dart';

class CustomStackWidget extends StatelessWidget {
  const CustomStackWidget({
    super.key,
    required this.image,
    required this.backgraound,
    required this.color,
  });
  final String image, backgraound;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBordingCubit, OnBordingState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgraound,
                  fit: BoxFit.fill,
                  color: color,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
             
                Visibility(
                  visible: state.pageIndex == 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(AppStrings.skip),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
