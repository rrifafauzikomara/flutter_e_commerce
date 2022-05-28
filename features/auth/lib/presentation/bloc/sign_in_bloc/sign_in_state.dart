import 'package:authentication/domain/entities/response/auth_response_entity.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class SignInState extends Equatable {
  final ViewData<AuthResponseEntity> signUpState;

  const SignInState({
    required this.signUpState,
  });

  SignInState copyWith({
    ViewData<AuthResponseEntity>? signUpState,
  }) {
    return SignInState(
      signUpState: signUpState ?? this.signUpState,
    );
  }

  @override
  List<Object?> get props => [
        signUpState,
      ];
}
