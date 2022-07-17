class AllPaymentResponseDto {
  AllPaymentResponseDto({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final List<PaymentDataDto> data;

  factory AllPaymentResponseDto.fromJson(Map<String, dynamic> json) =>
      AllPaymentResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<PaymentDataDto>.from(
            json["data"].map((x) => PaymentDataDto.fromJson(x))),
      );
}

class PaymentDataDto {
  PaymentDataDto({
    required this.name,
    required this.code,
    required this.paymentType,
    required this.isActivated,
  });

  final String? name;
  final String? code;
  final String? paymentType;
  final bool? isActivated;

  factory PaymentDataDto.fromJson(Map<String, dynamic> json) => PaymentDataDto(
        name: json["name"],
        code: json["code"],
        paymentType: json["payment_type"],
        isActivated: json["is_activated"],
      );
}
