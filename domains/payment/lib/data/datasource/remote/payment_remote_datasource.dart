import 'package:common/utils/constants/app_constants.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:payment/data/model/response/all_payment_response_dto.dart';
import 'package:payment/data/model/response/create_payment_response_dto.dart';
import 'package:payment/data/model/response/create_transaction_response_dto.dart';

abstract class PaymentRemoteDataSource {
  const PaymentRemoteDataSource();

  Future<AllPaymentResponseDto> getAllPaymentMethod();

  Future<CreateTransactionResponseDto> createTransaction(String paymentCode);

  Future<CreatePaymentResponseDto> createPayment(String transactionId);
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final Dio dio;

  const PaymentRemoteDataSourceImpl({required this.dio});

  @override
  Future<CreatePaymentResponseDto> createPayment(String transactionId) {
    // TODO: implement createPayment
    throw UnimplementedError();
  }

  @override
  Future<CreateTransactionResponseDto> createTransaction(String paymentCode) {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<AllPaymentResponseDto> getAllPaymentMethod() {
    // TODO: implement getAllPaymentMethod
    throw UnimplementedError();
  }


}
