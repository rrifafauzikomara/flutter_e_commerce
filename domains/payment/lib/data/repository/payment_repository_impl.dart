import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:payment/data/datasource/remote/payment_remote_datasource.dart';
import 'package:payment/data/mapper/payment_mapper.dart';
import 'package:payment/domain/entity/response/create_payment_entity.dart';
import 'package:payment/domain/entity/response/payment_entity.dart';
import 'package:payment/domain/repository/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final PaymentMapper mapper;

  PaymentRepositoryImpl({
    required this.remoteDataSource,
    required this.mapper,
  });

  @override
  Future<Either<FailureResponse, CreatePaymentDataEntity>> createTransaction(String paymentCode) {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureResponse, List<PaymentDataEntity>>> getAllPaymentMethod() {
    // TODO: implement getAllPaymentMethod
    throw UnimplementedError();
  }


}
