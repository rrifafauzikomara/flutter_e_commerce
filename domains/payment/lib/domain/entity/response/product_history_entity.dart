import 'package:dependencies/equatable/equatable.dart';

class HistoryEntity extends Equatable {
  const HistoryEntity({
    this.count = 0,
    this.countPerPage = 0,
    this.currentPage = 0,
    this.data = const <DataHistoryEntity>[],
  });

  final int count;
  final int countPerPage;
  final int currentPage;
  final List<DataHistoryEntity> data;

  @override
  List<Object?> get props => [count, countPerPage, currentPage];
}

class DataHistoryEntity extends Equatable {
  const DataHistoryEntity({
    this.id = "",
    this.groupId = "",
    this.customerId = "",
    this.sellerId = "",
    this.cartId = "",
    this.productData = const <ProductDataHistoryEntity>[],
    this.amount = 0,
    this.statusTransaction = "",
    this.paymentTransaction = const PaymentTransactionHistoryEntity(),
    this.createdAt = "",
    this.updatedAt = "",
  });

  final String id;
  final String groupId;
  final String customerId;
  final String sellerId;
  final String cartId;
  final List<ProductDataHistoryEntity> productData;
  final int amount;
  final String statusTransaction;
  final PaymentTransactionHistoryEntity paymentTransaction;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [
        id,
        groupId,
        customerId,
        sellerId,
        cartId,
        productData,
        amount,
        statusTransaction,
        paymentTransaction,
        createdAt,
        updatedAt,
      ];
}

class PaymentTransactionHistoryEntity extends Equatable {
  const PaymentTransactionHistoryEntity({
    this.method = "",
    this.statusPayment = "",
  });

  final String method;
  final String statusPayment;

  @override
  List<Object?> get props => [method, statusPayment];
}

class ProductDataHistoryEntity extends Equatable {
  const ProductDataHistoryEntity({
    this.product = const ProductHistoryEntity(),
    this.quantity = 0,
    this.createdAt = "",
    this.updatedAt = "",
  });

  final ProductHistoryEntity product;
  final int quantity;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [product, quantity, createdAt, updatedAt];
}

class ProductHistoryEntity extends Equatable {
  const ProductHistoryEntity({
    this.id = "",
    this.name = "",
    this.owner = "",
    this.stock = 0,
    this.price = 0,
    this.category = const CategoryHistoryEntity(),
    this.imageUrl = "",
    this.description = "",
    this.userInfo = const UserInfoHistoryEntity(),
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
  final CategoryHistoryEntity category;
  final String imageUrl;
  final String description;
  final UserInfoHistoryEntity userInfo;
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

class CategoryHistoryEntity extends Equatable {
  const CategoryHistoryEntity({
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

class UserInfoHistoryEntity extends Equatable {
  const UserInfoHistoryEntity({
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
