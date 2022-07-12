import 'package:dependencies/equatable/equatable.dart';

class ProductDetailDataEntity extends Equatable {
  const ProductDetailDataEntity({
    this.id = "",
    this.name = "",
    this.seller = const SellerDetailEntity(),
    this.stock = 0,
    this.category = const CategoryProductDetailEntity(),
    this.price = 0,
    this.imageUrl = "",
    this.description = "",
    this.soldCount = 0,
    this.popularity = 0,
  });

  final String id;
  final String name;
  final SellerDetailEntity seller;
  final int stock;
  final CategoryProductDetailEntity category;
  final int price;
  final String imageUrl;
  final String description;
  final int soldCount;
  final double popularity;

  @override
  List<Object?> get props => [
        id,
        name,
        seller,
        stock,
        category,
        price,
        imageUrl,
        description,
        soldCount,
        popularity,
      ];
}

class CategoryProductDetailEntity extends Equatable {
  const CategoryProductDetailEntity({
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

class SellerDetailEntity extends Equatable {
  const SellerDetailEntity({
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
