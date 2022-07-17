import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:cart/domain/usecases/get_chart_usecase.dart';
import 'package:cart_feature/presentation/bloc/bloc.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';

class CartCubit extends Cubit<CartState> {
  final GetChartUseCase getChartUseCase;

  CartCubit({
    required this.getChartUseCase,
  }) : super(CartState(
          cartListState: ViewData.initial(),
        ));

  void getCart() async {
    emit(state.copyWith(cartListState: ViewData.loading(message: 'Loading')));

    final result = await getChartUseCase.call(const NoParams());
    return result.fold(
      (failure) => _onFailureGetCart(failure),
      (data) => _onSuccessGetCart(data),
    );
  }

  Future<void> _onFailureGetCart(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        cartListState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessGetCart(
    ChartDataEntity data,
  ) async {
    if (data.product.isEmpty) {
      emit(state.copyWith(cartListState: ViewData.noData(message: "No Data")));
    } else {
      emit(state.copyWith(cartListState: ViewData.loaded(data: data)));
    }
  }
}
