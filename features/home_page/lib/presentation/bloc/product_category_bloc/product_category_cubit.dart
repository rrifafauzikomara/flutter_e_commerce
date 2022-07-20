import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/presentation/bloc/product_category_bloc/product_category_state.dart';
import 'package:product/domain/usecases/get_product_category_usecase.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  final GetProductCategoryUseCase getProductCategoryCase;

  ProductCategoryCubit({required this.getProductCategoryCase})
      : super(ProductCategoryState(productCategoryState: ViewData.initial()));

  void getProductCategory() async {
    emit(
      ProductCategoryState(
        productCategoryState: ViewData.loading(),
      ),
    );
    final result = await getProductCategoryCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        ProductCategoryState(
          productCategoryState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) => emit(
        ProductCategoryState(
          productCategoryState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
