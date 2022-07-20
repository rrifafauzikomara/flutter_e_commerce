import 'package:dependencies/equatable/equatable.dart';

class DetailProductArgument extends Equatable {
  final String productId;
  final String imageUrl;

  const DetailProductArgument({
    required this.productId,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [productId, imageUrl];
}
