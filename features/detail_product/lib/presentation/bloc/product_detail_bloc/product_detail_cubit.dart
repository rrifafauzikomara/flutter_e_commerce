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

  ProductDetailCubit({
    required this.getProductUseCase,
    required this.getSellerUseCase,
  }) : super(ProductDetailState(
          productState: ViewData.initial(),
          sellerState: ViewData.initial(),
        ));

  void getProduct(String productId) async {

  }

  Future<void> _onFailureProduct(
    FailureResponse failure,
  ) async {

  }

  Future<void> _onSuccessProduct(
    ProductDetailDataEntity data,
  ) async {

    await _getSeller(data.seller.id);
  }

  Future<void> _getSeller(String sellerId) async {

  }

  Future<void> _onFailureSeller(
    FailureResponse failure,
  ) async {

  }

  Future<void> _onSuccessSeller(
    SellerDataEntity data,
  ) async {

  }
}
