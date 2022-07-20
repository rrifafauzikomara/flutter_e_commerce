import 'package:cart/data/model/request/add_to_chart_dto.dart';
import 'package:cart/data/model/response/chart_response_dto.dart';
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
  Future<ChartResponseDto> addToChart(AddToChartDto body) {
    // TODO: implement addToChart
    throw UnimplementedError();
  }

  @override
  Future<ChartResponseDto> deleteChart(AddToChartDto body) {
    // TODO: implement deleteChart
    throw UnimplementedError();
  }

  @override
  Future<ChartResponseDto> getCharts() {
    // TODO: implement getCharts
    throw UnimplementedError();
  }


}
