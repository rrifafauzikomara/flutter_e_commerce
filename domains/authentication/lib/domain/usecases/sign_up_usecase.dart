import 'package:authentication/domain/entities/body/auth_request_entity.dart';
import 'package:authentication/domain/entities/response/auth_response_entity.dart';
import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase extends UseCase<AuthResponseEntity, AuthRequestEntity> {
  final AuthenticationRepository authenticationRepository;

  SignUpUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<FailureResponse, AuthResponseEntity>> call(
          AuthRequestEntity params) async =>
      await authenticationRepository.signUp(authRequestEntity: params);
}
