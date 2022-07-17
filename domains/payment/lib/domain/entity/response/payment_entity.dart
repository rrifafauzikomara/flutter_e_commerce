import 'package:dependencies/equatable/equatable.dart';

class PaymentDataEntity extends Equatable {
  const PaymentDataEntity({
    this.name = "",
    this.code = "",
    this.paymentType = "",
    this.isActivated = false,
  });

  final String name;
  final String code;
  final String paymentType;
  final bool isActivated;

  @override
  List<Object?> get props => [name, code, paymentType, isActivated];
}
