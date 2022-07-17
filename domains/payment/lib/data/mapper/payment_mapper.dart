import 'package:payment/data/model/response/all_payment_response_dto.dart';
import 'package:payment/domain/entity/response/payment_entity.dart';

class PaymentMapper {
  PaymentDataEntity _mapPaymentDataDtoToEntity(PaymentDataDto dto) {
    return PaymentDataEntity(
      name: dto.name ?? "",
      code: dto.code ?? "",
      paymentType: dto.paymentType ?? "",
      isActivated: dto.isActivated ?? false,
    );
  }

  List<PaymentDataEntity> mapListPaymentDataDtoToEntity(
      List<PaymentDataDto> dto) {
    final payments = <PaymentDataEntity>[];
    for (PaymentDataDto i in dto) {
      payments.add(_mapPaymentDataDtoToEntity(i));
    }
    return payments;
  }
}
