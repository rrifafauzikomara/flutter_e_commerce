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

  }

  void getAllPaymentMethod() async {

  }

  Future<void> _onFailureGetPaymentMethod(
    FailureResponse failure,
  ) async {

  }

  Future<void> _onSuccessGetPaymentMethod(
    List<PaymentDataEntity> data,
  ) async {

  }

  void createTransaction(String paymentCode) async {

  }

  Future<void> _onFailureCreateTransaction(
    FailureResponse failure,
  ) async {

  }

  Future<void> _onSuccessCreateTransaction(
    CreatePaymentDataEntity data,
  ) async {

  }
}
