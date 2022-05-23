import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class SplashState extends Equatable {
  final ViewData<bool> splashState;

  const SplashState({
    required this.splashState,
  });

  SplashState copyWith({
    ViewData<bool>? splashState,
  }) {
    return SplashState(
      splashState: splashState ?? this.splashState,
    );
  }

  @override
  List<Object?> get props => [splashState];
}
