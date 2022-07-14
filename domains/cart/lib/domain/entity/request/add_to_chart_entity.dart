import 'package:dependencies/equatable/equatable.dart';

class AddToChartEntity extends Equatable {
  final String productId;
  final int amount;
  final String productName;
  final String description;
  final String imageUrl;

  const AddToChartEntity({
    required this.productId,
    required this.amount,
    this.productName = "",
    this.description = "",
    this.imageUrl = "",
  });

  @override
  List<Object?> get props => [
        productId,
        amount,
        productName,
        description,
        imageUrl,
      ];
}
