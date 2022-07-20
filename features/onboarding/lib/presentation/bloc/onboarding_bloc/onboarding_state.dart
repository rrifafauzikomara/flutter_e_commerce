import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class OnBoardingState extends Equatable {
  final ViewData<bool> onBoardingState;

  const OnBoardingState({
    required this.onBoardingState,
  });

  OnBoardingState copyWith({
    ViewData<bool>? onBoardingState,
  }) {
    return OnBoardingState(
      onBoardingState: onBoardingState ?? this.onBoardingState,
    );
  }

  @override
  List<Object?> get props => [onBoardingState];
}
