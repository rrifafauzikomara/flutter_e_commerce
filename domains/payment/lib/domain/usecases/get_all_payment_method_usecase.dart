import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:payment/domain/entity/response/payment_entity.dart';
import 'package:payment/domain/repository/payment_repository.dart';

class GetAllPaymentMethodUseCase
    extends UseCase<List<PaymentDataEntity>, NoParams> {
  final PaymentRepository repository;

  GetAllPaymentMethodUseCase({
    required this.repository,
  });

  @override
  Future<Either<FailureResponse, List<PaymentDataEntity>>> call(
          NoParams params) async =>
      await repository.getAllPaymentMethod();
}
