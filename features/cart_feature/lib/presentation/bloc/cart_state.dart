import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:common/utils/state/view_data_state.dart';

class CartState {
  final ViewData<ChartDataEntity> cartListState;

  const CartState({
    required this.cartListState,
  });

  CartState copyWith({
    ViewData<ChartDataEntity>? cartListState,
  }) {
    return CartState(
      cartListState: cartListState ?? this.cartListState,
    );
  }
}
