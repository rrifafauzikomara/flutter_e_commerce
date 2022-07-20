class CreateTransactionResponseDto {
  CreateTransactionResponseDto({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool? status;
  final int? code;
  final String? message;
  final List<CreateTransactionDataDto> data;

  factory CreateTransactionResponseDto.fromJson(Map<String, dynamic> json) =>
      CreateTransactionResponseDto(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<CreateTransactionDataDto>.from(
            json["data"].map((x) => CreateTransactionDataDto.fromJson(x))),
      );
}

class CreateTransactionDataDto {
  CreateTransactionDataDto({
    required this.transactionId,
    required this.customerId,
    required this.sellerId,
    required this.cartId,
    required this.amount,
    required this.statusTransaction,
    required this.paymentTransaction,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? transactionId;
  final String? customerId;
  final String? sellerId;
  final String? cartId;
  final int? amount;
  final String? statusTransaction;
  final PaymentTransactionDto paymentTransaction;
  final String? createdAt;
  final String? updatedAt;

  factory CreateTransactionDataDto.fromJson(Map<String, dynamic> json) =>
      CreateTransactionDataDto(
        transactionId: json["id"],
        customerId: json["customer_id"],
        sellerId: json["seller_id"],
        cartId: json["cart_id"],
        amount: json["amount"],
        statusTransaction: json["status_transaction"],
        paymentTransaction:
            PaymentTransactionDto.fromJson(json["payment_transaction"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}

class PaymentTransactionDto {
  PaymentTransactionDto({
    required this.method,
    required this.statusPayment,
  });

  final String? method;
  final String? statusPayment;

  factory PaymentTransactionDto.fromJson(Map<String, dynamic> json) =>
      PaymentTransactionDto(
        method: json["method"],
        statusPayment: json["status_payment"],
      );
}
