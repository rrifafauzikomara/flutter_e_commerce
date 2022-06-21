import 'package:authentication/data/datasource/local/authentication_local_datasource.dart';
import 'package:authentication/data/datasource/remote/authentication_remote_datasource.dart';
import 'package:authentication/data/mapper/authentication_mapper.dart';
import 'package:authentication/domain/entities/body/auth_request_entity.dart';
import 'package:authentication/domain/entities/response/auth_response_entity.dart';
import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalDataSources authenticationLocalDataSources;
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationMapper mapper;

  AuthenticationRepositoryImpl({
    required this.authenticationLocalDataSources,
    required this.authenticationRemoteDataSource,
    required this.mapper,
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

  @override
  Future<Either<FailureResponse, bool>> cacheToken(
      {required String token}) async {
    try {
      await authenticationLocalDataSources.cacheToken(token: token);
      return const Right(true);
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, String>> getToken() async {
    try {
      final response = await authenticationLocalDataSources.getToken();
      return Right(response);
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, AuthResponseEntity>> signIn(
      {required AuthRequestEntity authRequestEntity}) async {
    try {
      final response = await authenticationRemoteDataSource.signIn(
          authRequestDto: mapper.mapAuthRequestEntityToAuthRequestDTO(
        authRequestEntity,
      ));
      return Right(
        mapper.mapAuthResponseDtoTOAuthResponseEntity(
          response.data!,
        ),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, AuthResponseEntity>> signUp(
      {required AuthRequestEntity authRequestEntity}) async {
    try {
      final response = await authenticationRemoteDataSource.signUp(
          authRequestDto: mapper.mapAuthRequestEntityToAuthRequestDTO(
        authRequestEntity,
      ));
      return Right(
        mapper.mapAuthResponseDtoTOAuthResponseEntity(
          response.data!,
        ),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, bool>> removeUserData() async {
    try {
      final response = await authenticationLocalDataSources.removeUserData();
      return Right(response);
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }
}
