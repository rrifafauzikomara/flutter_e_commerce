import 'package:account/presentation/bloc/user_bloc/user_state.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:profile/domain/usecases/get_user_usecase.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserUseCase getUserUseCase;

  UserCubit({required this.getUserUseCase})
      : super(UserState(userState: ViewData.initial()));

  void getUser() async {
    emit(
      UserState(
        userState: ViewData.loading(),
      ),
    );
    final result = await getUserUseCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        UserState(
          userState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) => emit(
        UserState(
          userState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
