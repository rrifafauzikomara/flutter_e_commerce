import 'package:authentication/data/model/body/auth_request_dto.dart';
import 'package:authentication/data/model/response/auth_response_dto.dart';
import 'package:authentication/domain/entities/body/auth_request_entity.dart';
import 'package:authentication/domain/entities/response/auth_response_entity.dart';

class AuthenticationMapper {
  AuthRequestDto mapAuthRequestEntityToAuthRequestDTO(
          AuthRequestEntity authRequestEntity) =>
      AuthRequestDto(
        username: authRequestEntity.username,
        password: authRequestEntity.password,
      );

  AuthResponseEntity mapAuthResponseDtoTOAuthResponseEntity(
          AuthDataResponse authDataResponse) =>
      AuthResponseEntity(
        token: authDataResponse.token ?? "",
      );
}
