import 'package:common/utils/navigation/argument/detail_product/detail_product_argument.dart';
import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/app_routes.dart';

abstract class HomeRouter {
  Future<dynamic>? navigateToEditProfile();

  void navigateToDetailProduct(DetailProductArgument argument);
}

class HomeRouterImpl implements HomeRouter {
  final NavigationHelper navigationHelper;

  HomeRouterImpl({
    required this.navigationHelper,
  });

  @override
  Future<dynamic>? navigateToEditProfile() =>
      navigationHelper.pushNamed(AppRoutes.editProfile);

  @override
  void navigateToDetailProduct(DetailProductArgument argument) =>
      navigationHelper.pushNamed(AppRoutes.detailProduct, arguments: argument);
}
