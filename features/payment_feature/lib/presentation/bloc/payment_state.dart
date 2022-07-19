import 'package:common/utils/navigation/argument/payment/payment_method_argument.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:payment/domain/entity/response/create_payment_entity.dart';
import 'package:payment/domain/entity/response/create_transaction_entity.dart';
import 'package:payment/domain/entity/response/payment_entity.dart';

class PaymentState {
  final ViewData<List<PaymentDataEntity>> paymentMethodState;
  final ViewData<List<CreateTransactionDataEntity>> createTransactionState;
  final ViewData<CreatePaymentDataEntity> createPaymentState;
  final PaymentMethodArgument? selectedPaymentMethod;

  const PaymentState({
    required this.paymentMethodState,
    required this.createPaymentState,
    required this.createTransactionState,
    this.selectedPaymentMethod,
  });

  PaymentState copyWith({
    ViewData<List<PaymentDataEntity>>? paymentMethodState,
    ViewData<List<CreateTransactionDataEntity>>? createTransactionState,
    ViewData<CreatePaymentDataEntity>? createPaymentState,
    PaymentMethodArgument? selectedPaymentMethod,
  }) {
    return PaymentState(
      paymentMethodState: paymentMethodState ?? this.paymentMethodState,
      createTransactionState:
          createTransactionState ?? this.createTransactionState,
      createPaymentState: createPaymentState ?? this.createPaymentState,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
    );
  }
}
