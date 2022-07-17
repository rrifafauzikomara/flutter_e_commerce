import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/auth_router.dart';
import 'package:common/utils/navigation/router/home_router.dart';
import 'package:common/utils/navigation/router/onboarding_router.dart';
import 'package:common/utils/navigation/router/product_router.dart';
import 'package:dependencies/get_it/get_it.dart';

class CommonDependencies {
  CommonDependencies() {
    _navigation();
    _routers();
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
    sl.registerLazySingleton<AuthRouter>(
      () => AuthRouterImpl(
        navigationHelper: sl(),
      ),
    );
    sl.registerLazySingleton<HomeRouter>(
      () => HomeRouterImpl(
        navigationHelper: sl(),
      ),
    );
    sl.registerLazySingleton<ProductRouter>(
      () => ProductRouterImpl(
        navigationHelper: sl(),
      ),
    );
  }
}
