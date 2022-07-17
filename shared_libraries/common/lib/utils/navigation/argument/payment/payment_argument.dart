import 'package:dependencies/equatable/equatable.dart';

class PaymentArgument extends Equatable {
  final int totalAmount;

  const PaymentArgument({required this.totalAmount});

  @override
  List<Object?> get props => [totalAmount];
}
