import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:product/domain/entity/response/product_detail_entity.dart';

class ProductDetailState extends Equatable {
  final ViewData<ProductDetailDataEntity> productState;

  const ProductDetailState({
    required this.productState,
  });

  ProductDetailState copyWith({
    ViewData<ProductDetailDataEntity>? productState,
  }) {
    return ProductDetailState(
      productState: productState ?? this.productState,
    );
  }

  @override
  List<Object?> get props => [productState];
}
