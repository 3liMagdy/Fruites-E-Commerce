import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'on_bording_state.dart';

class OnBordingCubit extends Cubit<OnBordingState> {
  OnBordingCubit() : super(const OnBordingState());

  final PageController pageController = PageController();

  /// Update current page index in state. UI should call this via
  /// `onPageChanged` from the PageView.
  void onPageChanged(int index) {
    emit(state.copyWith(pageIndex: index));
  }

  /// Trigger the start flow. Emits loading -> success/failure.
  Future<void> getStarted() async {
    try {
      emit(state.copyWith(status: OnBordingStatus.loading));
      await Future.delayed(const Duration(milliseconds: 300));
      emit(state.copyWith(status: OnBordingStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OnBordingStatus.failure, errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose(); 
    return super.close();
  }
}