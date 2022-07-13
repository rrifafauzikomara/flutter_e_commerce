import 'package:chart/data/model/request/add_to_chart_dto.dart';
import 'package:chart/data/model/response/chart_response_dto.dart';
import 'package:common/utils/constants/app_constants.dart';
import 'package:dependencies/dio/dio.dart';

abstract class ChartRemoteDataSource {
  const ChartRemoteDataSource();

  Future<ChartResponseDto> addToChart(AddToChartDto body);

  Future<ChartResponseDto> getCharts();

  Future<ChartResponseDto> deleteChart(AddToChartDto body);
}

class ChartRemoteDataSourceImpl implements ChartRemoteDataSource {
  final Dio dio;

  const ChartRemoteDataSourceImpl({required this.dio});

  @override
  Future<ChartResponseDto> addToChart(AddToChartDto body) async {
    try {
      final formData = FormData.fromMap({
        body.productId: body.amount,
      });
      final response = await dio.post(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.chart}",
        data: formData,
      );
      return ChartResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ChartResponseDto> getCharts() async {
    try {
      final response = await dio.get(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.chart}",
      );
      return ChartResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ChartResponseDto> deleteChart(AddToChartDto body) async {
    try {
      final formData = FormData.fromMap({
        body.productId: body.amount,
      });
      final response = await dio.delete(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.chart}",
        data: formData,
      );
      return ChartResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
