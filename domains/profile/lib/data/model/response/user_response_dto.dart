class UserResponseDto {
  UserResponseDto({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final UserDataDTO? data;

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      UserResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: UserDataDTO.fromJson(json["data"]),
      );
}

class UserDataDTO {
  UserDataDTO({
    this.id,
    this.username,
    this.role,
    this.imageUrl,
    this.fullName,
    this.city,
    this.simpleAddress,
  });

  final String? id;
  final String? username;
  final String? role;
  final String? imageUrl;
  final String? fullName;
  final String? city;
  final String? simpleAddress;

  factory UserDataDTO.fromJson(Map<String, dynamic> json) => UserDataDTO(
        id: json["id"],
        username: json["username"],
        role: json["role"],
        imageUrl: json["image_url"],
        fullName: json["full_name"],
        city: json["city"],
        simpleAddress: json["simple_address"],
      );
}
