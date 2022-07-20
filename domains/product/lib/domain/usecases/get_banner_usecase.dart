import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:product/domain/entity/response/banner_entity.dart';
import 'package:product/domain/repository/product_repository.dart';

class GetBannerUseCase extends UseCase<List<BannerDataEntity>, NoParams> {
  final ProductRepository productRepository;

  GetBannerUseCase({
    required this.productRepository,
  });

  @override
  Future<Either<FailureResponse, List<BannerDataEntity>>> call(
          NoParams params) async =>
      await productRepository.getBanner();
}
