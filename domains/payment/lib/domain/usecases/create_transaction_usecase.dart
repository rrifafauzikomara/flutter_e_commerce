import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:payment/domain/entity/response/create_transaction_entity.dart';
import 'package:payment/domain/repository/payment_repository.dart';

class CreateTransactionUseCase
    extends UseCase<List<CreateTransactionDataEntity>, String> {
  final PaymentRepository repository;

  CreateTransactionUseCase({
    required this.repository,
  });

  @override
  Future<Either<FailureResponse, List<CreateTransactionDataEntity>>> call(
          String params) async =>
      await repository.createTransaction(params);
}
