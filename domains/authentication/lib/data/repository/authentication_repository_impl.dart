import 'package:authentication/data/datasource/local/authentication_local_datasource.dart';
import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalDataSources authenticationLocalDataSources;

  AuthenticationRepositoryImpl({
    required this.authenticationLocalDataSources,
  });

  @override
  Future<Either<FailureResponse, bool>> cacheOnBoarding() async {
    try {
      await authenticationLocalDataSources.cacheOnBoarding();
      return const Right(true);
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, bool>> getOnBoardingStatus() async {
    try {
      final response =
          await authenticationLocalDataSources.getOnBoardingStatus();
      return Right(response);
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }
}
