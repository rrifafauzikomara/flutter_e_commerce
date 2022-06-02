import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class CacheFCMTokenUseCase extends UseCase<bool, String> {
  final AuthenticationRepository authenticationRepository;

  CacheFCMTokenUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<FailureResponse, bool>> call(String params) async =>
      await authenticationRepository.cacheFcmToken(token: params);
}
