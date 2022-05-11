import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/onboarding_router.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';

class CommonDependencies {
  CommonDependencies() {
    _navigation();
    _registerCore();
    _routers();
  }

  void _registerCore() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }

  void _navigation() => sl.registerLazySingleton<NavigationHelper>(
        () => NavigationHelperImpl(),
      );

  void _routers() {
    sl.registerLazySingleton<OnboardingRouter>(
      () => OnboardingRouterImpl(
        navigationHelper: sl(),
      ),
    );
  }
}
