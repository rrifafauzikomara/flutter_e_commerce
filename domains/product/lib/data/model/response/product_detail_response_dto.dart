class ProductDetailResponseDto {
  ProductDetailResponseDto({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final ProductDetailDataDto data;

  factory ProductDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      ProductDetailResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: ProductDetailDataDto.fromJson(json["data"]),
      );
}

class ProductDetailDataDto {
  ProductDetailDataDto({
    required this.id,
    required this.name,
    required this.seller,
    required this.stock,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.soldCount,
    required this.popularity,
  });

  final String? id;
  final String? name;
  final SellerDetailDto seller;
  final int? stock;
  final CategoryProductDetailDto category;
  final int? price;
  final String? imageUrl;
  final String? description;
  final int? soldCount;
  final double? popularity;

  factory ProductDetailDataDto.fromJson(Map<String, dynamic> json) =>
      ProductDetailDataDto(
        id: json["id"],
        name: json["name"],
        seller: SellerDetailDto.fromJson(json["seller"]),
        stock: json["stock"],
        category: CategoryProductDetailDto.fromJson(json["category"]),
        price: json["price"],
        imageUrl: json["image_url"],
        description: json["description"],
        soldCount: json["sold_count"],
        popularity: json["popularity"].toDouble(),
      );
}

class CategoryProductDetailDto {
  CategoryProductDetailDto({
    required this.id,
    required this.name,
    required this.imageCover,
    required this.imageIcon,
  });

  final String? id;
  final String? name;
  final String? imageCover;
  final String? imageIcon;

  factory CategoryProductDetailDto.fromJson(Map<String, dynamic> json) =>
      CategoryProductDetailDto(
        id: json["id"],
        name: json["name"],
        imageCover: json["image_cover"],
        imageIcon: json["image_icon"],
      );
}

class SellerDetailDto {
  SellerDetailDto({
    required this.id,
    required this.name,
    required this.city,
  });

  final String? id;
  final String? name;
  final String? city;

  factory SellerDetailDto.fromJson(Map<String, dynamic> json) =>
      SellerDetailDto(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );
}
