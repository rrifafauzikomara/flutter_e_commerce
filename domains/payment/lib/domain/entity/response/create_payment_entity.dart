import 'package:dependencies/equatable/equatable.dart';

class CreatePaymentDataEntity extends Equatable {
  const CreatePaymentDataEntity({
    this.id = "",
    this.ownerId = "",
    this.amount = 0,
    this.status = "",
    this.type = "",
    this.method = "",
    this.referenceId = "",
    this.transactionId = "",
    this.externalData = const ExternalDataEntity(),
    this.expirationDate = "",
  });

  final String id;
  final String ownerId;
  final int amount;
  final String status;
  final String type;
  final String method;
  final String referenceId;
  final String transactionId;
  final ExternalDataEntity externalData;
  final String expirationDate;

  @override
  List<Object?> get props => [
        id,
        ownerId,
        amount,
        status,
        type,
        method,
        referenceId,
        transactionId,
        externalData,
        expirationDate,
      ];
}

class ExternalDataEntity extends Equatable {
  const ExternalDataEntity({
    this.data = "",
    this.flag = "",
  });

  final String data;
  final String flag;

  @override
  List<Object?> get props => [data, flag];
}
