import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:product/domain/entity/response/product_detail_entity.dart';
import 'package:product/domain/repository/product_repository.dart';

class SaveProductUseCase extends UseCase<bool, ProductDetailDataEntity> {
  final ProductRepository productRepository;

  SaveProductUseCase({
    required this.productRepository,
  });

  @override
  Future<Either<FailureResponse, bool>> call(
          ProductDetailDataEntity params) async =>
      await productRepository.saveProduct(params);
}
