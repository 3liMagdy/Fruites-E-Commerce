part of 'on_bording_cubit.dart';

enum OnBordingStatus { initial, loading, success, failure }

class OnBordingState extends Equatable {
  final int pageIndex;
  final OnBordingStatus status;
  final String? errorMessage;

  const OnBordingState({
    this.pageIndex = 0,
    this.status = OnBordingStatus.initial,
    this.errorMessage,
  });

  OnBordingState copyWith({int? pageIndex, OnBordingStatus? status, String? errorMessage}) {
    return OnBordingState(
      pageIndex: pageIndex ?? this.pageIndex,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [pageIndex, status, errorMessage];
}


