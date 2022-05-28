import 'package:authentication/domain/entities/body/auth_request_entity.dart';
import 'package:dependencies/equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class UserNameChange extends SignUpEvent {
  final String username;

  const UserNameChange({required this.username});

  @override
  List<Object?> get props => [username];
}

class PasswordChange extends SignUpEvent {
  final String password;

  const PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];
}

class ConfirmPasswordChange extends SignUpEvent {
  final String password;
  final String confirmPassword;

  const ConfirmPasswordChange({
    required this.confirmPassword,
    required this.password,
  });

  @override
  List<Object?> get props => [confirmPassword, password];
}

class SignUp extends SignUpEvent {
  final AuthRequestEntity authRequestEntity;

  const SignUp({required this.authRequestEntity});

  @override
  List<Object?> get props => [ authRequestEntity];
}

class CacheToken extends SignUpEvent {
  final String token;

  const CacheToken({required this.token});

  @override
  List<Object?> get props => [ token];
}
