import 'package:dependencies/dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product/data/datasource/remote/product_remote_datasource.dart';
import 'package:product/data/mapper/product_mapper.dart';
import 'package:product/data/model/response/banner_response_dto.dart';
import 'package:product/data/repository/product_repository_impl.dart';
import 'package:product/domain/entity/response/banner_entity.dart';
import 'package:product/domain/repository/product_repository.dart';

void main() => testProductRepositoryTest();

class MockProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

void testProductRepositoryTest() {
  late final ProductRemoteDataSource _mockProductRemoteDataSource;
  late final ProductMapper _mockProductMapper;
  late final ProductRepository _productRepository;

  setUpAll(() {
    _mockProductRemoteDataSource = MockProductRemoteDataSource();
    _mockProductMapper = ProductMapper();
    _productRepository = ProductRepositoryImpl(
      productRemoteDataSource: _mockProductRemoteDataSource,
      mapper: _mockProductMapper,
    );
  });

  group('Product Repository Impl', () {
    test('''Success \t
    GIVEN Right<BannerResponseDTO> from RemoteDataSource
    WHEN getBanner method executed
    THEN return Right<List<BannerDataEntity>>
    ''', () async {
      /// GIVEN
      when(() => _mockProductRemoteDataSource.getBanner()).thenAnswer(
        (_) async => Future.value(
          BannerResponseDTO(
            status: true,
            code: 200,
            message: "success",
            data: [
              BannerDataDTO(
                id: 'id',
                name: 'name',
                headline: 'headline',
                caption: 'caption',
                imageUrl: 'imageUrl',
                sellerId: '1',
                productId: '0',
              )
            ],
          ),
        ),
      );

      /// WHEN
      final result = await _productRepository.getBanner();

      /// THEN
      expect(result, isA<Right>());
      expect(result.getOrElse(() => []).first, isA<BannerDataEntity>());
      expect(result.getOrElse(() => []).first.name, "name");
    });

    test('''Fail \t
    GIVEN Right<BannerResponseDTO> from RemoteDataSource
    WHEN getBanner method executed
    THEN return Left<Failure>
    ''', () async {
      /// GIVEN
      when(() => _mockProductRemoteDataSource.getBanner())
          .thenThrow(DioError(requestOptions: RequestOptions(path: "")));

      /// WHEN
      final result = await _productRepository.getBanner();

      /// THEN
      expect(result, isA<Left>());
    });
  });
}
