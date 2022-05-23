import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';

class GetOnBoardingStatusUseCase extends UseCase<bool, NoParams> {
  final AuthenticationRepository authenticationRepository;

  GetOnBoardingStatusUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<FailureResponse, bool>> call(NoParams params) async =>
      authenticationRepository.getOnBoardingStatus();
}
