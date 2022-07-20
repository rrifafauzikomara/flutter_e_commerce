import 'package:product/domain/entity/response/product_category_entity.dart';

class ProductDataEntity {
  ProductDataEntity({
    required this.count,
    required this.countPerPage,
    required this.currentPage,
    required this.data,
  });

  final int count;
  final int countPerPage;
  final int currentPage;
  final List<ProductEntity> data;
}

class ProductEntity {
  ProductEntity({
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

  final String id;
  final String name;
  final SellerEntity seller;
  final int stock;
  final ProductCategoryEntity category;
  final int price;
  final String imageUrl;
  final String description;
  final int soldCount;
  final double popularity;
}

class SellerEntity {
  SellerEntity({
    required this.id,
    required this.name,
    required this.city,
  });

  final String id;
  final String name;
  final String city;
}
