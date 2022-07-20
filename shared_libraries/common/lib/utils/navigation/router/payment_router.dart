import 'package:common/utils/navigation/argument/arguments.dart';
import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/app_routes.dart';

abstract class PaymentRouter {
  Future<dynamic>? navigateToPaymentMethod();

  void selectPayment(PaymentMethodArgument argument);

  Future<dynamic>? navigateToPaymentVA(PaymentVAArgument argument);

  void navigateToHome();
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

  @override
  void selectPayment(PaymentMethodArgument argument) =>
      navigationHelper.pop(argument);

  @override
  Future? navigateToPaymentVA(PaymentVAArgument argument) => navigationHelper
      .pushNamedAndRemoveUntil(AppRoutes.paymentVa, arguments: argument);

  @override
  void navigateToHome() =>
      navigationHelper.pushNamedAndRemoveUntil(AppRoutes.home);
}
