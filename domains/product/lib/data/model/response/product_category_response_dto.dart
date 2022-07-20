class ProductCategoryResponseDto {
  ProductCategoryResponseDto({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final List<ProductCategoryDataDTO>? data;

  factory ProductCategoryResponseDto.fromJson(Map<String, dynamic> json) =>
      ProductCategoryResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<ProductCategoryDataDTO>.from(
            json["data"].map((x) => ProductCategoryDataDTO.fromJson(x))),
      );
}

class ProductCategoryDataDTO {
  ProductCategoryDataDTO({
    this.id,
    this.name,
    this.imageCover,
    this.imageIcon,
  });

  final String? id;
  final String? name;
  final String? imageCover;
  final String? imageIcon;

  factory ProductCategoryDataDTO.fromJson(Map<String, dynamic> json) =>
      ProductCategoryDataDTO(
        id: json["id"],
        name: json["name"],
        imageCover: json["image_cover"],
        imageIcon: json["image_icon"],
      );
}
