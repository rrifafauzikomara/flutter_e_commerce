import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:common/utils/state/view_data_state.dart';

class CartState {
  final ViewData<ChartDataEntity> cartListState;
  final int totalAmount;
  final bool selectAll;
  final List<bool> selectProducts;

  const CartState({
    required this.cartListState,
    this.totalAmount = 0,
    this.selectAll = false,
    this.selectProducts = const <bool>[],
  });

  CartState copyWith({
    ViewData<ChartDataEntity>? cartListState,
    int? totalAmount,
    bool? selectAll,
    List<bool>? selectProducts,
  }) {
    return CartState(
      cartListState: cartListState ?? this.cartListState,
      totalAmount: totalAmount ?? this.totalAmount,
      selectAll: selectAll ?? this.selectAll,
      selectProducts: selectProducts ?? this.selectProducts,
    );
  }
}
