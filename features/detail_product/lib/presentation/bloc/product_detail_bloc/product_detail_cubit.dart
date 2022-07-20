import 'package:cart/domain/entity/request/add_to_chart_entity.dart';
import 'package:cart/domain/usecases/add_to_chart_usecase.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:detail_product/presentation/bloc/product_detail_bloc/bloc.dart';
import 'package:product/domain/entity/response/product_detail_entity.dart';
import 'package:product/domain/entity/response/seller_data_entity.dart';
import 'package:product/domain/usecases/delete_product_usecase.dart';
import 'package:product/domain/usecases/get_favorite_product_by_url_usecase.dart';
import 'package:product/domain/usecases/get_product_detail_usecase.dart';
import 'package:product/domain/usecases/get_seller_usecase.dart';
import 'package:product/domain/usecases/save_product_usecase.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductDetailUseCase getProductUseCase;
  final GetSellerUseCase getSellerUseCase;
  final AddToChartUseCase addToChartUseCase;
  final SaveProductUseCase saveProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;
  final GetFavoriteProductByUrlUseCase getFavoriteProductByUrlUseCase;

  ProductDetailCubit({
    required this.getProductUseCase,
    required this.getSellerUseCase,
    required this.addToChartUseCase,
    required this.saveProductUseCase,
    required this.deleteProductUseCase,
    required this.getFavoriteProductByUrlUseCase,
  }) : super(ProductDetailState(
          productState: ViewData.initial(),
          sellerState: ViewData.initial(),
          addToChartState: ViewData.initial(),
          saveProductState: ViewData.initial(),
          deleteProductState: ViewData.initial(),
        ));

  void getProductFavorite(String imageUrl) async {
    final result = await getFavoriteProductByUrlUseCase.call(imageUrl);
    return result.fold(
      (_) => _onFailureGetProduct(),
      (data) => _onSuccessGetProduct(),
    );
  }

  void _onFailureGetProduct() {
    emit(state.copyWith(isFavorite: false));
  }

  void _onSuccessGetProduct() {
    emit(state.copyWith(isFavorite: true));
  }

  void saveProduct(ProductDetailDataEntity entity) async {
    emit(
        state.copyWith(saveProductState: ViewData.loading(message: 'Loading')));

    final result = await saveProductUseCase.call(entity);
    return result.fold(
      (failure) => _onFailureSaveProduct(failure),
      (data) => _onSuccessSaveProduct(data),
    );
  }

  void _onFailureSaveProduct(
    FailureResponse failure,
  ) {
    emit(state.copyWith(
        saveProductState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  void _onSuccessSaveProduct(bool data) {
    emit(state.copyWith(
      saveProductState: ViewData.loaded(data: data),
      isFavorite: true,
    ));
  }

  void deleteProduct(String productUrl) async {
    emit(state.copyWith(
        deleteProductState: ViewData.loading(message: 'Loading')));

    final result = await deleteProductUseCase.call(productUrl);
    return result.fold(
      (failure) => _onFailureDeleteProduct(failure),
      (data) => _onSuccessDeleteProduct(data),
    );
  }

  void _onFailureDeleteProduct(
    FailureResponse failure,
  ) {
    emit(state.copyWith(
      deleteProductState:
          ViewData.error(message: failure.errorMessage, failure: failure),
    ));
  }

  void _onSuccessDeleteProduct(bool data) {
    emit(state.copyWith(
      deleteProductState: ViewData.loaded(data: data),
      isFavorite: false,
    ));
  }

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
