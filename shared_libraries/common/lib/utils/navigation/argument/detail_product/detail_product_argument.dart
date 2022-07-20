import 'package:dependencies/equatable/equatable.dart';

class DetailProductArgument extends Equatable {
  final String productId;

  const DetailProductArgument({
    required this.productId,
  });

  @override
  List<Object?> get props => [productId];
}
