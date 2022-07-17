import 'package:common/utils/state/view_data_state.dart';
import 'package:payment/domain/entity/response/create_payment_entity.dart';
import 'package:payment/domain/entity/response/create_transaction_entity.dart';
import 'package:payment/domain/entity/response/payment_entity.dart';

class PaymentState {
  final ViewData<List<PaymentDataEntity>> paymentMethodState;
  final ViewData<List<CreateTransactionDataEntity>> createTransactionState;
  final ViewData<CreatePaymentDataEntity> createPaymentState;

  const PaymentState({
    required this.paymentMethodState,
    required this.createPaymentState,
    required this.createTransactionState,
  });

  PaymentState copyWith({
    ViewData<List<PaymentDataEntity>>? paymentMethodState,
    ViewData<List<CreateTransactionDataEntity>>? createTransactionState,
    ViewData<CreatePaymentDataEntity>? createPaymentState,
  }) {
    return PaymentState(
      paymentMethodState: paymentMethodState ?? this.paymentMethodState,
      createTransactionState:
          createTransactionState ?? this.createTransactionState,
      createPaymentState: createPaymentState ?? this.createPaymentState,
    );
  }
}
