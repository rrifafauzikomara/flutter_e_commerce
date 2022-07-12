import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:detail_product/presentation/bloc/product_detail_bloc/bloc.dart';
import 'package:product/domain/usecases/get_product_detail_usecase.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductDetailUseCase getProductUseCase;

  ProductDetailCubit({required this.getProductUseCase})
      : super(ProductDetailState(productState: ViewData.initial()));

  void getProduct(String productId) async {
    emit(
      ProductDetailState(
        productState: ViewData.loading(),
      ),
    );
    final result = await getProductUseCase.call(productId);
    result.fold(
      (failure) => emit(
        ProductDetailState(
          productState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) => emit(
        ProductDetailState(
          productState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
