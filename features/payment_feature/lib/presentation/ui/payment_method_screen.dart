import 'package:common/utils/navigation/argument/payment/payment_method_argument.dart';
import 'package:common/utils/navigation/router/payment_router.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/card/payment_method_card.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_feature/presentation/bloc/bloc.dart';
import 'package:resources/colors.gen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
