import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/app_routes.dart';

abstract class HomeRouter {
  Future<dynamic>? navigateToEditProfile();
}

class HomeRouterImpl implements HomeRouter {
  final NavigationHelper navigationHelper;

  HomeRouterImpl({
    required this.navigationHelper,
  });

  @override
  Future<dynamic>? navigateToEditProfile() =>
      navigationHelper.pushNamed(AppRoutes.editProfile);
}
