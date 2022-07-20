class SellerResponseDto {
  SellerResponseDto({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final SellerDataDto data;

  factory SellerResponseDto.fromJson(Map<String, dynamic> json) =>
      SellerResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: SellerDataDto.fromJson(json["data"]),
      );
}

class SellerDataDto {
  SellerDataDto({
    required this.id,
    required this.username,
    required this.role,
    required this.imageUrl,
    required this.fullName,
    required this.city,
    required this.simpleAddress,
  });

  final String? id;
  final String? username;
  final String? role;
  final String? imageUrl;
  final String? fullName;
  final String? city;
  final String? simpleAddress;

  factory SellerDataDto.fromJson(Map<String, dynamic> json) => SellerDataDto(
        id: json["id"],
        username: json["username"],
        role: json["role"],
        imageUrl: json["image_url"],
        fullName: json["full_name"],
        city: json["city"],
        simpleAddress: json["simple_address"],
      );
}
