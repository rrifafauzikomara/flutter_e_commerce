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
    required this.productName,
    required this.description,
    required this.imageUrl,
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
