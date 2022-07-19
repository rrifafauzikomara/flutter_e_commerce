import 'package:dependencies/equatable/equatable.dart';

class PaymentMethodArgument extends Equatable {
  final String bankName;
  final String paymentCode;

  const PaymentMethodArgument({
    required this.bankName,
    required this.paymentCode,
  });

  @override
  List<Object?> get props => [bankName, paymentCode];
}
