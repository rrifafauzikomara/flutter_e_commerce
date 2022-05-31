import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:product/domain/entity/response/product_entity.dart';

class ProductState extends Equatable {
  final ViewData<ProductDataEntity> productState;

  const ProductState({
    required this.productState,
  });

  ProductState copyWith({
    ViewData<ProductDataEntity>? productState,
  }) {
    return ProductState(
      productState: productState ?? this.productState,
    );
  }

  @override
  List<Object?> get props => [productState];
}
