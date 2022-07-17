import 'package:dependencies/equatable/equatable.dart';

class CreateTransactionDataEntity extends Equatable {
  const CreateTransactionDataEntity({
    this.transactionId = "",
    this.customerId = "",
    this.sellerId = "",
    this.cartId = "",
    this.amount = 0,
    this.statusTransaction = "",
    this.paymentTransaction = const PaymentTransactionEntity(),
    this.createdAt = "",
    this.updatedAt = "",
  });

  final String transactionId;
  final String customerId;
  final String sellerId;
  final String cartId;
  final int amount;
  final String statusTransaction;
  final PaymentTransactionEntity paymentTransaction;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [
        transactionId,
        customerId,
        sellerId,
        cartId,
        amount,
        statusTransaction,
        paymentTransaction,
        createdAt,
        updatedAt,
      ];
}

class PaymentTransactionEntity extends Equatable {
  const PaymentTransactionEntity({
    this.method = "",
    this.statusPayment = "",
  });

  final String method;
  final String statusPayment;

  @override
  List<Object?> get props => [method, statusPayment];
}
