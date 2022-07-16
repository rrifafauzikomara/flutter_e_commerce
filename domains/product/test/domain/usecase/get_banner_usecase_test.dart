import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product/domain/repository/product_repository.dart';
import 'package:product/domain/usecases/get_banner_usecase.dart';

void main() => testGetBannerUseCase();

class MockProductRepository extends Mock implements ProductRepository {}

void testGetBannerUseCase() {
  late final ProductRepository _mockProductRepository;
  late final GetBannerUseCase _getBannerUseCase;

  setUpAll(() {
    _mockProductRepository = MockProductRepository();
    _getBannerUseCase =
        GetBannerUseCase(productRepository: _mockProductRepository);
  });

  group("Get Banner Use Case", () {
    test('''Success \t
    GIVEN Right<List<BannerDataEntity> from ProductRepository
    WHEN call method executed
    THEN return Right<List<BannerDataEntity>
    ''', () async {
      /// GIVEN
      when(() => _mockProductRepository.getBanner()).thenAnswer(
        (_) async => const Right([]),
      );

      /// WHEN
      final result = await _getBannerUseCase.call(
        const NoParams(),
      );

      /// THEN
      expect(result, isA<Right>());
    });

    test('''Failed \t
    GIVEN Left<Failure> from ProductRepository
    WHEN call method executed
    THEN return Left<Failure>
    ''', () async {
      /// GIVEN
      when(() => _mockProductRepository.getBanner()).thenAnswer(
        (_) async => const Left(
          FailureResponse(errorMessage: ''),
        ),
      );

      /// WHEN
      final result = await _getBannerUseCase.call(
        const NoParams(),
      );

      /// THEN
      expect(result, isA<Left>());
    });
  });
}
