import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:product/domain/repository/product_repository.dart';

class DeleteProductUseCase extends UseCase<bool, String> {
  final ProductRepository productRepository;

  DeleteProductUseCase({
    required this.productRepository,
  });

  @override
  Future<Either<FailureResponse, bool>> call(String params) async =>
      await productRepository.deleteProduct(params);
}
