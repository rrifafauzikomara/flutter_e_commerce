import 'package:cart/domain/entity/request/add_to_chart_entity.dart';
import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:common/utils/error/failure_response.dart';

abstract class ChartRepository {
  const ChartRepository();

  Future<Either<FailureResponse, ChartDataEntity>> addToChart(
      AddToChartEntity body);

  Future<Either<FailureResponse, ChartDataEntity>> getCharts();

  Future<Either<FailureResponse, ChartDataEntity>> deleteChart(
      AddToChartEntity body);
}
