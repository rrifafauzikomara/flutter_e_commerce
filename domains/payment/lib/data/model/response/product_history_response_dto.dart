class HistoryDataDto {
  HistoryDataDto({
    required this.count,
    required this.countPerPage,
    required this.currentPage,
    required this.data,
  });

  final int? count;
  final int? countPerPage;
  final int? currentPage;
  final List<DataHistoryDto> data;

  factory HistoryDataDto.fromJson(Map<String, dynamic> json) => HistoryDataDto(
        count: json["count"],
        countPerPage: json["count_per_page"],
        currentPage: json["current_page"],
        data: List<DataHistoryDto>.from(
            json["data"].map((x) => DataHistoryDto.fromJson(x))),
      );
}

class DataHistoryDto {
  DataHistoryDto({
    required this.id,
    required this.groupId,
    required this.customerId,
    required this.sellerId,
    required this.cartId,
    required this.productData,
    required this.amount,
    required this.statusTransaction,
    required this.paymentTransaction,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? groupId;
  final String? customerId;
  final String? sellerId;
  final String? cartId;
  final List<ProductDataHistoryDto> productData;
  final int? amount;
  final String? statusTransaction;
  final PaymentTransactionHistoryDto paymentTransaction;
  final String? createdAt;
  final String? updatedAt;

  factory DataHistoryDto.fromJson(Map<String, dynamic> json) => DataHistoryDto(
        id: json["id"],
        groupId: json["group_id"],
        customerId: json["customer_id"],
        sellerId: json["seller_id"],
        cartId: json["cart_id"],
        productData: List<ProductDataHistoryDto>.from(
            json["product_data"].map((x) => ProductDataHistoryDto.fromJson(x))),
        amount: json["amount"],
        statusTransaction: json["status_transaction"],
        paymentTransaction:
            PaymentTransactionHistoryDto.fromJson(json["payment_transaction"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}

class PaymentTransactionHistoryDto {
  PaymentTransactionHistoryDto({
    required this.method,
    required this.statusPayment,
  });

  final String? method;
  final String? statusPayment;

  factory PaymentTransactionHistoryDto.fromJson(Map<String, dynamic> json) =>
      PaymentTransactionHistoryDto(
        method: json["method"],
        statusPayment: json["status_payment"],
      );
}

class ProductDataHistoryDto {
  ProductDataHistoryDto({
    required this.product,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  final ProductHistoryDto product;
  final int? quantity;
  final String? createdAt;
  final String? updatedAt;

  factory ProductDataHistoryDto.fromJson(Map<String, dynamic> json) =>
      ProductDataHistoryDto(
        product: ProductHistoryDto.fromJson(json["product"]),
        quantity: json["quantity"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}

class ProductHistoryDto {
  ProductHistoryDto({
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
  final CategoryHistoryDto category;
  final String? imageUrl;
  final String? description;
  final UserInfoHistoryDto userInfo;
  final int? soldCount;
  final double? popularity;
  final String? createdAt;
  final String? updatedAt;

  factory ProductHistoryDto.fromJson(Map<String, dynamic> json) =>
      ProductHistoryDto(
        id: json["id"],
        name: json["name"],
        owner: json["owner"],
        stock: json["stock"],
        price: json["price"],
        category: CategoryHistoryDto.fromJson(json["category"]),
        imageUrl: json["image_url"],
        description: json["description"],
        userInfo: UserInfoHistoryDto.fromJson(json["user_info"]),
        soldCount: json["sold_count"],
        popularity: json["popularity"].toDouble(),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}

class CategoryHistoryDto {
  CategoryHistoryDto({
    required this.id,
    required this.name,
    required this.imageCover,
    required this.imageIcon,
  });

  final String? id;
  final String? name;
  final String? imageCover;
  final String? imageIcon;

  factory CategoryHistoryDto.fromJson(Map<String, dynamic> json) =>
      CategoryHistoryDto(
        id: json["id"],
        name: json["name"],
        imageCover: json["image_cover"],
        imageIcon: json["image_icon"],
      );
}

class UserInfoHistoryDto {
  UserInfoHistoryDto({
    required this.id,
    required this.name,
    required this.city,
  });

  final String? id;
  final String? name;
  final String? city;

  factory UserInfoHistoryDto.fromJson(Map<String, dynamic> json) =>
      UserInfoHistoryDto(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );
}
