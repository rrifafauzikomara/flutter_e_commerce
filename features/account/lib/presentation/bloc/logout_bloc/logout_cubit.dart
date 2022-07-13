import 'package:account/presentation/bloc/logout_bloc/logout_state.dart';
import 'package:authentication/domain/usecases/logout_usecase.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit({required this.logoutUseCase})
      : super(LogoutState(logoutState: ViewData.initial()));

  void logout() async {
    emit(
      LogoutState(
        logoutState: ViewData.loading(),
      ),
    );
    final result = await logoutUseCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        LogoutState(
          logoutState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) => emit(
        LogoutState(
          logoutState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
