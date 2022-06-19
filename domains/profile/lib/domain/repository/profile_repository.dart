import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:profile/domain/entity/request/user_request_entity.dart';
import 'package:profile/domain/entity/response/user_entity.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  Future<Either<FailureResponse, UserEntity>> getUser();

  Future<Either<FailureResponse, UserEntity>> updateUserData(
      {required UserRequestEntity userRequestEntity});
}
