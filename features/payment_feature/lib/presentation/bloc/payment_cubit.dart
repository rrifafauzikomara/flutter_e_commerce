import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/navigation/argument/payment/payment_method_argument.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:payment/domain/entity/response/create_payment_entity.dart';
import 'package:payment/domain/entity/response/payment_entity.dart';
import 'package:payment/domain/usecases/create_transaction_usecase.dart';
import 'package:payment/domain/usecases/get_all_payment_method_usecase.dart';
import 'package:payment_feature/presentation/bloc/bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final GetAllPaymentMethodUseCase getAllPaymentMethodUseCase;
  final CreateTransactionUseCase createTransactionUseCase;

  PaymentCubit({
    required this.getAllPaymentMethodUseCase,
    required this.createTransactionUseCase,
  }) : super(PaymentState(
          paymentMethodState: ViewData.initial(),
          createPaymentState: ViewData.initial(),
        ));

  void selectPaymentMethod(PaymentMethodArgument argument) {
    emit(state.copyWith(selectedPaymentMethod: argument));
  }

  void getAllPaymentMethod() async {
    emit(state.copyWith(
        paymentMethodState: ViewData.loading(message: 'Loading')));

    final result = await getAllPaymentMethodUseCase.call(const NoParams());
    return result.fold(
      (failure) => _onFailureGetPaymentMethod(failure),
      (data) => _onSuccessGetPaymentMethod(data),
    );
  }

  Future<void> _onFailureGetPaymentMethod(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        paymentMethodState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessGetPaymentMethod(
    List<PaymentDataEntity> data,
  ) async {
    if (data.isEmpty) {
      emit(state.copyWith(
          paymentMethodState: ViewData.noData(message: "No Data")));
    } else {
      emit(state.copyWith(
        paymentMethodState: ViewData.loaded(data: data),
      ));
    }
  }

  void createTransaction(String paymentCode) async {
    emit(state.copyWith(
        createPaymentState: ViewData.loading(message: "Loading")));

    final result = await createTransactionUseCase.call(paymentCode);

    return result.fold(
      (failure) => _onFailureCreateTransaction(failure),
      (data) => _onSuccessCreateTransaction(data),
    );
  }

  Future<void> _onFailureCreateTransaction(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        createPaymentState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessCreateTransaction(
    CreatePaymentDataEntity data,
  ) async {
    emit(state.copyWith(
      createPaymentState: ViewData.loaded(data: data),
    ));
  }
}
