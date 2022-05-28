import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class SignInState extends Equatable {
  final ViewData signInState;

  const SignInState({
    required this.signInState,
  });

  SignInState copyWith({
    ViewData? signInState,
  }) {
    return SignInState(
      signInState: signInState ?? this.signInState,
    );
  }

  @override
  List<Object?> get props => [
        signInState,
      ];
}
