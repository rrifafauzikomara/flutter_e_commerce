import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  Future<Either<FailureResponse, bool>> cacheOnBoarding();

  Future<Either<FailureResponse, bool>> getOnBoardingStatus();
}
