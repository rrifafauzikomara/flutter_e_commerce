import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/app_routes.dart';

abstract class PaymentRouter {
  Future<dynamic>? navigateToPaymentMethod();
}

class PaymentRouterImpl implements PaymentRouter {
  final NavigationHelper navigationHelper;

  PaymentRouterImpl({
    required this.navigationHelper,
  });

  @override
  Future<dynamic>? navigateToPaymentMethod() async =>
      await navigationHelper.pushNamed(
        AppRoutes.paymentMethod,
      );
}
