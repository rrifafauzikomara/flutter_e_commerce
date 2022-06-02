import 'package:authentication/domain/usecases/cache_fcm_token_usecase.dart';
import 'package:authentication/domain/usecases/get_onboarding_status_usecase.dart';
import 'package:authentication/domain/usecases/get_token_usecase.dart';
import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/firebase/firebase.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetOnBoardingStatusUseCase getOnBoardingStatusUseCase;
  final GetTokenUseCase getTokenUseCase;
  final CacheFCMTokenUseCase cacheFCMTokenUseCase;
  final FirebaseMessaging firebaseMessaging;

  SplashCubit({
    required this.getOnBoardingStatusUseCase,
    required this.getTokenUseCase,
    required this.cacheFCMTokenUseCase,
    required this.firebaseMessaging,
  }) : super(SplashState(splashState: ViewData.initial()));

  void initSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    final fcmToken = await firebaseMessaging.getToken();
    await cacheFCMTokenUseCase.call(fcmToken ?? "");
    final onBoardingStatus =
        await getOnBoardingStatusUseCase.call(const NoParams());
    onBoardingStatus.fold(
      (failure) => emit(
        SplashState(
          splashState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) async {
        if (result) {
          final isTokenAvailable = await getTokenUseCase.call(const NoParams());
          isTokenAvailable.fold(
            (failure) => emit(
              SplashState(
                splashState: ViewData.error(
                    message: failure.errorMessage, failure: failure),
              ),
            ),
            (result) async {
              if (result.isEmpty) {
                emit(
                  SplashState(
                    splashState: ViewData.loaded(
                      data: AppConstants.cachedKey.onBoardingKey,
                    ),
                  ),
                );
              } else {
                emit(
                  SplashState(
                    splashState: ViewData.loaded(
                      data: AppConstants.cachedKey.tokenKey,
                    ),
                  ),
                );
              }
            },
          );
        } else {
          emit(
            SplashState(
              splashState: ViewData.noData(message: ""),
            ),
          );
        }
      },
    );
  }
}
