import 'package:common/utils/constants/app_constants.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:profile/data/model/request/user_request_dto.dart';
import 'package:profile/data/model/response/user_response_dto.dart';

abstract class ProfileRemoteDataSource {
  const ProfileRemoteDataSource();

  Future<UserResponseDto> getUser();

  Future<UserResponseDto> updateUserData(
      {required UserRequestDto userRequestDto});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  const ProfileRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserResponseDto> getUser() async {
    try {
      final response = await dio.get(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.user}",
      );
      return UserResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserResponseDto> updateUserData(
      {required UserRequestDto userRequestDto}) async {
    try {
      final response = await dio.put(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.user}",
        data: userRequestDto.toJson(),
      );
      return UserResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
