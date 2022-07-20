class ChartResponseDto {
  ChartResponseDto({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final ChartDataDto data;

  factory ChartResponseDto.fromJson(Map<String, dynamic> json) =>
      ChartResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: ChartDataDto.fromJson(json["data"]),
      );
}

class ChartDataDto {
  ChartDataDto({
    required this.id,
    required this.owner,
    required this.amount,
    required this.product,
  });

  final String? id;
  final String? owner;
  final int? amount;
  final List<ProductsChartDto> product;

  factory ChartDataDto.fromJson(Map<String, dynamic> json) => ChartDataDto(
        id: json["id"],
        owner: json["owner"],
        amount: json["amount"],
        product: List<ProductsChartDto>.from(
            json["product"].map((x) => ProductsChartDto.fromJson(x))),
      );
}

class ProductsChartDto {
  ProductsChartDto({
    required this.product,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  final ProductChartDto product;
  final int? quantity;
  final String? createdAt;
  final String? updatedAt;

  factory ProductsChartDto.fromJson(Map<String, dynamic> json) =>
      ProductsChartDto(
        product: ProductChartDto.fromJson(json["product"]),
        quantity: json["quantity"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}

class ProductChartDto {
  ProductChartDto({
    required this.id,
    required this.name,
    required this.owner,
    required this.stock,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.userInfo,
    required this.soldCount,
    required this.popularity,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? owner;
  final int? stock;
  final int? price;
  final CategoryChartDto category;
  final String? imageUrl;
  final String? description;
  final UserInfoChartDto userInfo;
  final int? soldCount;
  final double? popularity;
  final String? createdAt;
  final String? updatedAt;

  factory ProductChartDto.fromJson(Map<String, dynamic> json) =>
      ProductChartDto(
        id: json["id"],
        name: json["name"],
        owner: json["owner"],
        stock: json["stock"],
        price: json["price"],
        category: CategoryChartDto.fromJson(json["category"]),
        imageUrl: json["image_url"],
        description: json["description"],
        userInfo: UserInfoChartDto.fromJson(json["user_info"]),
        soldCount: json["sold_count"],
        popularity: json["popularity"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}

class CategoryChartDto {
  CategoryChartDto({
    required this.id,
    required this.name,
    required this.imageCover,
    required this.imageIcon,
  });

  final String? id;
  final String? name;
  final String? imageCover;
  final String? imageIcon;

  factory CategoryChartDto.fromJson(Map<String, dynamic> json) =>
      CategoryChartDto(
        id: json["id"],
        name: json["name"],
        imageCover: json["image_cover"],
        imageIcon: json["image_icon"],
      );
}

class UserInfoChartDto {
  UserInfoChartDto({
    required this.id,
    required this.name,
    required this.city,
  });

  final String? id;
  final String? name;
  final String? city;

  factory UserInfoChartDto.fromJson(Map<String, dynamic> json) =>
      UserInfoChartDto(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );
}
