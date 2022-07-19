import 'package:dependencies/equatable/equatable.dart';

class PaymentVAArgument extends Equatable {
  final String bankName;
  final String virtualAccount;
  final int totalPrices;

  const PaymentVAArgument({
    required this.bankName,
    required this.virtualAccount,
    required this.totalPrices,
  });

  @override
  List<Object?> get props => [bankName, virtualAccount, totalPrices];
}
