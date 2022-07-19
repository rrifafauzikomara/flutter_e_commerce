import 'package:common/utils/constants/app_constants.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:payment/data/model/response/all_payment_response_dto.dart';
import 'package:payment/data/model/response/create_payment_response_dto.dart';
import 'package:payment/data/model/response/create_transaction_response_dto.dart';
import 'package:payment/data/model/response/product_history_response_dto.dart';

abstract class PaymentRemoteDataSource {
  const PaymentRemoteDataSource();

  Future<AllPaymentResponseDto> getAllPaymentMethod();

  Future<CreateTransactionResponseDto> createTransaction(String paymentCode);

  Future<CreatePaymentResponseDto> createPayment(String transactionId);

  Future<ProductHistoryResponseDto> getHistory();
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final Dio dio;

  const PaymentRemoteDataSourceImpl({required this.dio});

  @override
  Future<AllPaymentResponseDto> getAllPaymentMethod() async {
    try {
      final response = await dio.get(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.paymentMethod}",
      );
      return AllPaymentResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CreatePaymentResponseDto> createPayment(String transactionId) async {
    try {
      final response = await dio.post(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.createPayment}",
        queryParameters: {
          "transaction_id": transactionId,
        },
      );
      return CreatePaymentResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CreateTransactionResponseDto> createTransaction(
      String paymentCode) async {
    try {
      final response = await dio.post(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.createTransaction}",
        queryParameters: {
          "payment": paymentCode,
        },
      );
      return CreateTransactionResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductHistoryResponseDto> getHistory() async {
    try {
      final response = await dio.get(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.history}",
      );
      return ProductHistoryResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
