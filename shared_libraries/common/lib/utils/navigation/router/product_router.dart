import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/app_routes.dart';

abstract class ProductRouter {
  void navigateToCartList();
}

class ProductRouterImpl implements ProductRouter {
  final NavigationHelper navigationHelper;

  ProductRouterImpl({
    required this.navigationHelper,
  });

  @override
  void navigateToCartList() => navigationHelper.pushNamed(AppRoutes.cartList);
}
