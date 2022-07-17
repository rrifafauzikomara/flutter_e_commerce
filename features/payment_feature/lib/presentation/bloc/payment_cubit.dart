import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:payment/domain/entity/response/create_payment_entity.dart';
import 'package:payment/domain/entity/response/create_transaction_entity.dart';
import 'package:payment/domain/entity/response/payment_entity.dart';
import 'package:payment/domain/usecases/create_payment_usecase.dart';
import 'package:payment/domain/usecases/create_transaction_usecase.dart';
import 'package:payment/domain/usecases/get_all_payment_method_usecase.dart';
import 'package:payment_feature/presentation/bloc/bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final GetAllPaymentMethodUseCase getAllPaymentMethodUseCase;
  final CreateTransactionUseCase createTransactionUseCase;
  final CreatePaymentUseCase createPaymentUseCase;

  PaymentCubit({
    required this.getAllPaymentMethodUseCase,
    required this.createPaymentUseCase,
    required this.createTransactionUseCase,
  }) : super(PaymentState(
          paymentMethodState: ViewData.initial(),
          createTransactionState: ViewData.initial(),
          createPaymentState: ViewData.initial(),
        ));

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

  void createPayment(String transactionId) async {
    emit(state.copyWith(
        createPaymentState: ViewData.loading(message: "Loading")));

    final result = await createPaymentUseCase.call(transactionId);

    return result.fold(
      (failure) => _onFailureCreatePayment(failure),
      (data) => _onSuccessCreatePayment(data),
    );
  }

  Future<void> _onFailureCreatePayment(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        createPaymentState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessCreatePayment(
    CreatePaymentDataEntity data,
  ) async {
    emit(state.copyWith(
      createPaymentState: ViewData.loaded(data: data),
    ));
  }

  void createTransaction(String paymentCode) async {
    emit(state.copyWith(
        createTransactionState: ViewData.loading(message: "Loading")));

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
        createTransactionState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessCreateTransaction(
    List<CreateTransactionDataEntity> data,
  ) async {
    if (data.isEmpty) {
      emit(state.copyWith(
          createTransactionState: ViewData.noData(message: "No Data")));
    } else {
      emit(state.copyWith(
        createTransactionState: ViewData.loaded(data: data),
      ));
    }
  }
}
