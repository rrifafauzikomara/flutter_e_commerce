import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:payment/domain/entity/response/product_history_entity.dart';
import 'package:payment/domain/repository/payment_repository.dart';

class GetHistoryUseCase extends UseCase<HistoryEntity, NoParams> {
  final PaymentRepository repository;

  GetHistoryUseCase({
    required this.repository,
  });

  @override
  Future<Either<FailureResponse, HistoryEntity>> call(NoParams params) async =>
      await repository.getHistory();
}
