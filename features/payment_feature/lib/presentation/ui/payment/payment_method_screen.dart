import 'package:common/utils/navigation/argument/payment/payment_method_argument.dart';
import 'package:common/utils/navigation/router/payment_router.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/card/payment_method_card.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_feature/presentation/bloc/payment/bloc.dart';
import 'package:resources/colors.gen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final _paymentRouter = sl<PaymentRouter>();

  void _selectPayment(PaymentMethodArgument argument) {
    _paymentRouter.selectPayment(argument);
  }

  @override
  void initState() {
    super.initState();
    _loadPaymentMethod(context);
  }

  void _loadPaymentMethod(BuildContext context) {
    context.read<PaymentCubit>().getAllPaymentMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: AppBar(
        backgroundColor: ColorName.white,
        elevation: 0.0,
        title: Container(
          alignment: Alignment.centerLeft,
          height: 35.h,
          child: Text(
            "Pembayaran",
            style: TextStyle(
              color: ColorName.orange,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: ColorName.orange),
      ),
      body: Center(
        child: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            if (state.paymentMethodState.status.isLoading) {
              return const CustomCircularProgressIndicator();
            } else if (state.paymentMethodState.status.isError) {
              return Text(state.paymentMethodState.message);
            } else if (state.paymentMethodState.status.isNoData) {
              return Text(state.paymentMethodState.message);
            } else if (state.paymentMethodState.status.isHasData) {
              final payments = state.paymentMethodState.data ?? [];
              return ListView.builder(
                padding: EdgeInsets.only(left: 16.h, right: 10.h),
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  final payment = payments[index];
                  return PaymentMethodCard(
                    bankName: payment.name,
                    selectPaymentMethod: () =>
                        _selectPayment(PaymentMethodArgument(
                      bankName: payment.name,
                      paymentCode: payment.code,
                    )),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
