import 'package:authentication/domain/usecases/cache_onboarding_usecase.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final CacheOnBoardingUseCase cacheOnBoardingUseCase;

  OnBoardingCubit({
    required this.cacheOnBoardingUseCase,
  }) : super(OnBoardingState(onBoardingState: ViewData.initial()));

  void saveOnBoardingStatus() async {
    final result = await cacheOnBoardingUseCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        OnBoardingState(
          onBoardingState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) => {
        emit(
          OnBoardingState(
            onBoardingState: ViewData.loaded(
              data: result,
            ),
          ),
        )
      },
    );
  }
}
