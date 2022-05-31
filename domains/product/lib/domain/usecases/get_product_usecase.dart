import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:product/domain/entity/response/product_entity.dart';
import 'package:product/domain/repository/product_repository.dart';

class GetProductCase extends UseCase<ProductDataEntity, NoParams> {
  final ProductRepository productRepository;

  GetProductCase({
    required this.productRepository,
  });

  @override
  Future<Either<FailureResponse, ProductDataEntity>> call(
          NoParams params) async =>
      await productRepository.getProduct();
}
