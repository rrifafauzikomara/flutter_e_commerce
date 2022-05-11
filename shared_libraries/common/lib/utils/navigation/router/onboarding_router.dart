import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/app_routes.dart';

abstract class OnboardingRouter {
  void navigateToOnboarding();
}

class OnboardingRouterImpl implements OnboardingRouter {
  final NavigationHelper navigationHelper;

  OnboardingRouterImpl({required this.navigationHelper});

  @override
  void navigateToOnboarding() =>
      navigationHelper.pushReplacementNamed(AppRoutes.onboarding);
}
