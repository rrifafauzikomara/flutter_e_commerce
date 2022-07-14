import 'package:cart/domain/entity/request/add_to_chart_entity.dart';
import 'package:cart/domain/usecases/add_to_chart_usecase.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:detail_product/presentation/bloc/product_detail_bloc/bloc.dart';
import 'package:product/domain/entity/response/product_detail_entity.dart';
import 'package:product/domain/entity/response/seller_data_entity.dart';
import 'package:product/domain/usecases/get_product_detail_usecase.dart';
import 'package:product/domain/usecases/get_seller_usecase.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductDetailUseCase getProductUseCase;
  final GetSellerUseCase getSellerUseCase;
  final AddToChartUseCase addToChartUseCase;

  ProductDetailCubit({
    required this.getProductUseCase,
    required this.getSellerUseCase,
    required this.addToChartUseCase,
  }) : super(ProductDetailState(
          productState: ViewData.initial(),
          sellerState: ViewData.initial(),
          addToChartState: ViewData.initial(),
        ));

  void addToChart(AddToChartEntity body) async {
    emit(state.copyWith(addToChartState: ViewData.loading(message: 'Loading')));

    final result = await addToChartUseCase.call(body);
    return result.fold(
      (failure) => _onFailureAddToChart(failure),
      (data) => _onSuccessAddToChart(body),
    );
  }

  Future<void> _onFailureAddToChart(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        addToChartState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessAddToChart(
    AddToChartEntity data,
  ) async {
    emit(state.copyWith(addToChartState: ViewData.loaded(data: data)));
  }

  void getProduct(String productId) async {
    emit(state.copyWith(productState: ViewData.loading(message: 'Loading')));

    final result = await getProductUseCase.call(productId);
    return result.fold(
      (failure) => _onFailureProduct(failure),
      (data) => _onSuccessProduct(data),
    );
  }

  Future<void> _onFailureProduct(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        productState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessProduct(
    ProductDetailDataEntity data,
  ) async {
    emit(state.copyWith(productState: ViewData.loaded(data: data)));
    await _getSeller(data.seller.id);
  }

  Future<void> _getSeller(String sellerId) async {
    emit(state.copyWith(sellerState: ViewData.loading(message: 'Loading')));

    final result = await getSellerUseCase.call(sellerId);
    return result.fold(
      (failure) => _onFailureSeller(failure),
      (result) => _onSuccessSeller(result),
    );
  }

  Future<void> _onFailureSeller(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        sellerState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessSeller(
    SellerDataEntity data,
  ) async {
    emit(state.copyWith(sellerState: ViewData.loaded(data: data)));
  }
}
