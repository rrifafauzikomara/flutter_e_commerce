import 'package:common/utils/constants/app_constants.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:payment/data/model/response/all_payment_response_dto.dart';

abstract class PaymentRemoteDataSource {
  const PaymentRemoteDataSource();

  Future<AllPaymentResponseDto> getAllPaymentMethod();
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
}
