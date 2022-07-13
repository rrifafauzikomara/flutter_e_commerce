import 'package:chart/domain/entity/request/add_to_chart_entity.dart';
import 'package:chart/domain/entity/response/chart_entity.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:common/utils/error/failure_response.dart';

abstract class ChartRepository {
  const ChartRepository();

  Future<Either<FailureResponse, ChartDataEntity>> addToChart(
      AddToChartEntity body);
}
