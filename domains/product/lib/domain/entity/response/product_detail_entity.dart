class ProductDetailDataEntity {
  ProductDetailDataEntity({
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
  final SellerDetailEntity seller;
  final int stock;
  final CategoryProductDetailEntity category;
  final int price;
  final String imageUrl;
  final String description;
  final int soldCount;
  final double popularity;
}

class CategoryProductDetailEntity {
  CategoryProductDetailEntity({
    required this.id,
    required this.name,
    required this.imageCover,
    required this.imageIcon,
  });

  final String id;
  final String name;
  final String imageCover;
  final String imageIcon;
}

class SellerDetailEntity {
  SellerDetailEntity({
    required this.id,
    required this.name,
    required this.city,
  });

  final String id;
  final String name;
  final String city;
}
