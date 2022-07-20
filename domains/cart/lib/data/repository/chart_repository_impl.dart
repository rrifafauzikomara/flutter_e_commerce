import 'package:cart/data/datasource/remote/chart_remote_datasource.dart';
import 'package:cart/data/mapper/chart_mapper.dart';
import 'package:cart/domain/entity/request/add_to_chart_entity.dart';
import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:cart/domain/repository/chart_repository.dart';
import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ChartRemoteDataSource chartRemoteDataSource;
  final ChartMapper mapper;

  ChartRepositoryImpl({
    required this.chartRemoteDataSource,
    required this.mapper,
  });

  @override
  Future<Either<FailureResponse, ChartDataEntity>> addToChart(AddToChartEntity body) {
    // TODO: implement addToChart
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureResponse, ChartDataEntity>> deleteChart(AddToChartEntity body) {
    // TODO: implement deleteChart
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureResponse, ChartDataEntity>> getCharts() {
    // TODO: implement getCharts
    throw UnimplementedError();
  }


}
