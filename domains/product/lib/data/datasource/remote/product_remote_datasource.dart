import 'package:dependencies/dio/dio.dart';
import 'package:product/data/model/response/banner_response_dto.dart';
import 'package:product/data/model/response/product_category_response_dto.dart';
import 'package:product/data/model/response/product_response_dto.dart';
import 'package:common/utils/constants/app_constants.dart';

abstract class ProductRemoteDataSource {
  const ProductRemoteDataSource();

  Future<ProductCategoryResponseDto> getProductCategory();

  Future<ProductResponseDto> getProduct();

  Future<BannerResponseDTO> getBanner();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  const ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductResponseDto> getProduct() async {
    try {
      final response = await dio.get(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.product}",
      );
      return ProductResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductCategoryResponseDto> getProductCategory() async {
    try {
      final response = await dio.get(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.category}",
      );
      return ProductCategoryResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BannerResponseDTO> getBanner() async {
    try {
      final response = await dio.get(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.banner}",
      );
      return BannerResponseDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
