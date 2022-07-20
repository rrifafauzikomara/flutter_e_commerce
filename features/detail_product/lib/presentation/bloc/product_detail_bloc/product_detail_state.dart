import 'package:common/utils/state/view_data_state.dart';
import 'package:product/domain/entity/response/product_detail_entity.dart';
import 'package:product/domain/entity/response/seller_data_entity.dart';

class ProductDetailState {
  final ViewData<ProductDetailDataEntity> productState;
  final ViewData<SellerDataEntity> sellerState;

  const ProductDetailState({
    required this.productState,
    required this.sellerState,
  });

  ProductDetailState copyWith({
    ViewData<ProductDetailDataEntity>? productState,
    ViewData<SellerDataEntity>? sellerState,
  }) {
    return ProductDetailState(
      productState: productState ?? this.productState,
      sellerState: sellerState ?? this.sellerState,
    );
  }
}
