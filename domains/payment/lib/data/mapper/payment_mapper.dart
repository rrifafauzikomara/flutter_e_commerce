import 'package:payment/data/model/response/all_payment_response_dto.dart';
import 'package:payment/data/model/response/create_payment_response_dto.dart';
import 'package:payment/data/model/response/create_transaction_response_dto.dart';
import 'package:payment/domain/entity/response/create_payment_entity.dart';
import 'package:payment/domain/entity/response/create_transaction_entity.dart';
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

  List<CreateTransactionDataEntity> mapListCreateTransactionDataDtoToEntity(
      List<CreateTransactionDataDto> dto) {
    final data = <CreateTransactionDataEntity>[];
    for (var i in dto) {
      data.add(_mapCreateTransactionDataDtoToEntity(i));
    }
    return data;
  }

  CreateTransactionDataEntity _mapCreateTransactionDataDtoToEntity(
      CreateTransactionDataDto dto) {
    return CreateTransactionDataEntity(
      transactionId: dto.transactionId ?? "",
      customerId: dto.customerId ?? "",
      sellerId: dto.sellerId ?? "",
      cartId: dto.cartId ?? "",
      amount: dto.amount ?? 0,
      statusTransaction: dto.statusTransaction ?? "",
      paymentTransaction:
          _mapPaymentTransactionDtoToEntity(dto.paymentTransaction),
      createdAt: dto.createdAt ?? "",
      updatedAt: dto.updatedAt ?? "",
    );
  }

  PaymentTransactionEntity _mapPaymentTransactionDtoToEntity(
      PaymentTransactionDto dto) {
    return PaymentTransactionEntity(
      method: dto.method ?? "",
      statusPayment: dto.statusPayment ?? "",
    );
  }

  ExternalDataEntity _mapExternalDataDtoToEntity(ExternalDataDto dto) {
    return ExternalDataEntity(
      data: dto.data ?? "",
      flag: dto.flag ?? "",
    );
  }

  CreatePaymentDataEntity mapCreatePaymentDataDtoToEntity(
      CreatePaymentDataDto dto) {
    return CreatePaymentDataEntity(
      id: dto.id ?? "",
      ownerId: dto.ownerId ?? "",
      amount: dto.amount ?? 0,
      status: dto.status ?? "",
      type: dto.type ?? "",
      method: dto.method ?? "",
      referenceId: dto.referenceId ?? "",
      transactionId: dto.transactionId ?? "",
      externalData: _mapExternalDataDtoToEntity(dto.externalData),
      expirationDate: dto.expirationDate ?? "",
    );
  }

}
