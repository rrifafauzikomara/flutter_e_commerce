import 'package:dependencies/intl/intl.dart';

extension MoneyExtension on int {
  String toIDR() {
    return NumberFormat.simpleCurrency(
      locale: 'ID',
      name: 'Rp ',
      decimalDigits: 0
    ).format(this);
  }
}
