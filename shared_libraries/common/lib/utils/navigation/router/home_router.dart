import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/app_routes.dart';

abstract class HomeRouter {
  void navigateToEditProfile();
}

class HomeRouterImpl implements HomeRouter {
  final NavigationHelper navigationHelper;

  HomeRouterImpl({
    required this.navigationHelper,
  });

  @override
  void navigateToEditProfile() =>
      navigationHelper.pushReplacementNamed(AppRoutes.editProfile);
}
