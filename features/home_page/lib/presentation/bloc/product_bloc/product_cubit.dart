import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/presentation/bloc/product_bloc/product_state.dart';
import 'package:product/domain/usecases/get_product_usecase.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductUseCase getProductUseCase;

  ProductCubit({required this.getProductUseCase})
      : super(ProductState(productState: ViewData.initial()));

  void getProduct() async {
    emit(
      ProductState(
        productState: ViewData.loading(),
      ),
    );
    final result = await getProductUseCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        ProductState(
          productState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) => emit(
        ProductState(
          productState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
