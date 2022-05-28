import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';

class GetTokenUseCase extends UseCase<String, NoParams> {
  final AuthenticationRepository authenticationRepository;

  GetTokenUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<FailureResponse, String>> call(NoParams params) async =>
      authenticationRepository.getToken();
}
