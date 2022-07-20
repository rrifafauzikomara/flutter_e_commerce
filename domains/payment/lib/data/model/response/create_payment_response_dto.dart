class CreatePaymentResponseDto {
  CreatePaymentResponseDto({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final CreatePaymentDataDto data;

  factory CreatePaymentResponseDto.fromJson(Map<String, dynamic> json) =>
      CreatePaymentResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: CreatePaymentDataDto.fromJson(json["data"]),
      );
}

class CreatePaymentDataDto {
  CreatePaymentDataDto({
    required this.id,
    required this.ownerId,
    required this.amount,
    required this.status,
    required this.type,
    required this.method,
    required this.referenceId,
    required this.transactionId,
    required this.externalData,
    required this.expirationDate,
  });

  final String? id;
  final String? ownerId;
  final int? amount;
  final String? status;
  final String? type;
  final String? method;
  final String? referenceId;
  final String? transactionId;
  final ExternalDataDto externalData;
  final String? expirationDate;

  factory CreatePaymentDataDto.fromJson(Map<String, dynamic> json) =>
      CreatePaymentDataDto(
        id: json["id"],
        ownerId: json["owner_id"],
        amount: json["amount"],
        status: json["status"],
        type: json["type"],
        method: json["method"],
        referenceId: json["reference_id"],
        transactionId: json["transaction_id"],
        externalData: ExternalDataDto.fromJson(json["external_data"]),
        expirationDate: json["expiration_date"],
      );
}

class ExternalDataDto {
  ExternalDataDto({
    required this.data,
    required this.flag,
  });

  final String? data;
  final String? flag;

  factory ExternalDataDto.fromJson(Map<String, dynamic> json) =>
      ExternalDataDto(
        data: json["data"],
        flag: json["flag"],
      );
}
