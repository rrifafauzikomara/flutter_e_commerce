import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:product/data/datasource/local/product_local_datasource.dart';
import 'package:product/data/datasource/remote/product_remote_datasource.dart';
import 'package:product/data/mapper/product_mapper.dart';
import 'package:product/domain/entity/response/banner_entity.dart';
import 'package:product/domain/entity/response/product_category_entity.dart';
import 'package:product/domain/entity/response/product_detail_entity.dart';
import 'package:product/domain/entity/response/product_entity.dart';
import 'package:product/domain/entity/response/seller_data_entity.dart';
import 'package:product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;
  final ProductMapper mapper;

  ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.productLocalDataSource,
    required this.mapper,
  });

  @override
  Future<Either<FailureResponse, ProductDataEntity>> getProduct() async {
    try {
      final response = await productRemoteDataSource.getProduct();
      return Right(
        mapper.mapProductDataDTOToProductDataEntity(
          response.data!,
        ),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, List<ProductCategoryEntity>>>
      getProductCategory() async {
    try {
      final response = await productRemoteDataSource.getProductCategory();
      return Right(
        mapper.mapProductCategoryDTOtoEntity(
          response.data!,
        ),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, List<BannerDataEntity>>> getBanner() async {
    try {
      final response = await productRemoteDataSource.getBanner();
      return Right(
        mapper.mapBannerDataDTOToEntity(
          response.data!,
        ),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, ProductDetailDataEntity>> getProductDetail(
      String productId) async {
    try {
      final response =
          await productRemoteDataSource.getProductDetail(productId);
      return Right(
        mapper.mapProductDetailDataDtoToEntity(response.data),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, SellerDataEntity>> getSeller(
      String sellerId) async {
    try {
      final response = await productRemoteDataSource.getSeller(sellerId);
      return Right(
        mapper.mapSellerDataResponseDtoToEntity(response.data),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, bool>> deleteProduct(String productUrl) async {
    try {
      final response = await productLocalDataSource.deleteProduct(productUrl);
      return Right(response);
    } catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, ProductDetailDataEntity>>
      getFavoriteProductByUrl(String productUrl) async {
    try {
      final response =
          await productLocalDataSource.getFavoriteProductByUrl(productUrl);
      final data = mapper.mapProductDetailTableToEntity(response);
      return Right(data);
    } catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, bool>> saveProduct(
      ProductDetailDataEntity data) async {
    try {
      final table = mapper.mapProductDetailDataEntityToTable(data);
      final response = await productLocalDataSource.saveProduct(table);
      return Right(response);
    } catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }
}
