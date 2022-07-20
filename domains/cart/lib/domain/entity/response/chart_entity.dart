import 'package:dependencies/equatable/equatable.dart';

class ChartDataEntity extends Equatable {
  const ChartDataEntity({
    this.id = "",
    this.owner = "",
    this.amount = 0,
    this.product = const <ProductsChartEntity>[],
  });

  final String id;
  final String owner;
  final int amount;
  final List<ProductsChartEntity> product;

  @override
  List<Object?> get props => [id, owner, amount, product];
}

class ProductsChartEntity extends Equatable {
  const ProductsChartEntity({
    this.product = const ProductChartEntity(),
    this.quantity = 0,
    this.createdAt = "",
    this.updatedAt = "",
  });

  final ProductChartEntity product;
  final int quantity;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [product, quantity, createdAt, updatedAt];
}

class ProductChartEntity extends Equatable {
  const ProductChartEntity({
    this.id = "",
    this.name = "",
    this.owner = "",
    this.stock = 0,
    this.price = 0,
    this.category = const CategoryChartEntity(),
    this.imageUrl = "",
    this.description = "",
    this.userInfo = const UserInfoChartEntity(),
    this.soldCount = 0,
    this.popularity = 0.0,
    this.createdAt = "",
    this.updatedAt = "",
  });

  final String id;
  final String name;
  final String owner;
  final int stock;
  final int price;
  final CategoryChartEntity category;
  final String imageUrl;
  final String description;
  final UserInfoChartEntity userInfo;
  final int soldCount;
  final double popularity;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        owner,
        stock,
        price,
        category,
        imageUrl,
        description,
        userInfo,
        soldCount,
        popularity,
        createdAt,
        updatedAt,
      ];
}

class CategoryChartEntity extends Equatable {
  const CategoryChartEntity({
    this.id = "",
    this.name = "",
    this.imageCover = "",
    this.imageIcon = "",
  });

  final String id;
  final String name;
  final String imageCover;
  final String imageIcon;

  @override
  List<Object?> get props => [id, name, imageCover, imageIcon];
}

class UserInfoChartEntity extends Equatable {
  const UserInfoChartEntity({
    this.id = "",
    this.name = "",
    this.city = "",
  });

  final String id;
  final String name;
  final String city;

  @override
  List<Object?> get props => [id, name, city];
}
