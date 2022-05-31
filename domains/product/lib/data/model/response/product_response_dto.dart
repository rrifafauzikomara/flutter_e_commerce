import 'product_category_response_dto.dart';

class ProductResponseDto {
  ProductResponseDto({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final ProductDataDTO? data;

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      ProductResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: ProductDataDTO.fromJson(json["data"]),
      );
}

class ProductDataDTO {
  ProductDataDTO({
    this.count,
    this.countPerPage,
    this.currentPage,
    this.data,
  });

  final int? count;
  final int? countPerPage;
  final int? currentPage;
  final List<ProductDTO>? data;

  factory ProductDataDTO.fromJson(Map<String, dynamic> json) => ProductDataDTO(
        count: json["count"],
        countPerPage: json["count_per_page"],
        currentPage: json["current_page"],
        data: List<ProductDTO>.from(
            json["data"].map((x) => ProductDTO.fromJson(x))),
      );
}

class ProductDTO {
  ProductDTO({
    this.id,
    this.name,
    this.seller,
    this.stock,
    this.category,
    this.price,
    this.imageUrl,
    this.description,
    this.soldCount,
    this.popularity,
  });

  final String? id;
  final String? name;
  final SellerDTO? seller;
  final int? stock;
  final ProductCategoryDataDTO? category;
  final int? price;
  final String? imageUrl;
  final String? description;
  final int? soldCount;
  final double? popularity;

  factory ProductDTO.fromJson(Map<String, dynamic> json) => ProductDTO(
        id: json["id"],
        name: json["name"],
        seller: SellerDTO.fromJson(json["seller"]),
        stock: json["stock"],
        category: ProductCategoryDataDTO.fromJson(json["category"]),
        price: json["price"],
        imageUrl: json["image_url"],
        description: json["description"],
        soldCount: json["sold_count"],
        popularity: json["popularity"].toDouble(),
      );
}

class SellerDTO {
  SellerDTO({
    this.id,
    this.name,
    this.city,
  });

  final String? id;
  final String? name;
  final String? city;

  factory SellerDTO.fromJson(Map<String, dynamic> json) => SellerDTO(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );
}
