import 'package:common/utils/extensions/money_extension.dart';
import 'package:common/utils/navigation/argument/arguments.dart';
import 'package:common/utils/navigation/router/payment_router.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/divider/custom_divider.dart';
import 'package:component/widget/toast/custom_toast.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:payment_feature/presentation/bloc/bloc.dart';
import 'package:resources/colors.gen.dart';
import 'package:component/widget/button/payment_button.dart';

class PaymentScreen extends StatefulWidget {
  final PaymentArgument argument;

  const PaymentScreen({Key? key, required this.argument}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
