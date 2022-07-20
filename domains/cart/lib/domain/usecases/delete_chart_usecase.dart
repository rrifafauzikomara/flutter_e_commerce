import 'package:cart/domain/entity/request/add_to_chart_entity.dart';
import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:cart/domain/repository/chart_repository.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';

class DeleteChartUseCase extends UseCase<ChartDataEntity, AddToChartEntity> {
  final ChartRepository chartRepository;

  DeleteChartUseCase({
    required this.chartRepository,
  });

  @override
  Future<Either<FailureResponse, ChartDataEntity>> call(
          AddToChartEntity params) async =>
      await chartRepository.deleteChart(params);
}
