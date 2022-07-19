import 'package:common/utils/extensions/money_extension.dart';
import 'package:common/utils/navigation/argument/arguments.dart';
import 'package:common/utils/navigation/router/payment_router.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/divider/custom_divider.dart';
import 'package:component/widget/toast/custom_toast.dart';
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
  final _paymentRouter = sl<PaymentRouter>();

  void _navigateToPaymentMethod(BuildContext context) async {
    final result = await _paymentRouter.navigateToPaymentMethod();
    if (result != null) {
      if (result is PaymentMethodArgument) {
        _selectedPaymentMethod(argument: result);
      }
    }
  }

  void _navigateToPaymentVa(PaymentVAArgument argument) {
    _paymentRouter.navigateToPaymentVA(argument);
  }

  void _selectedPaymentMethod({
    required PaymentMethodArgument argument,
  }) {
    context.read<PaymentCubit>().selectPaymentMethod(argument);
  }

  void _payment(BuildContext context, {required String paymentCode}) {
    context.read<PaymentCubit>().createTransaction(paymentCode);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state.createPaymentState.status.isError) {
          CustomToast.showErrorToast(
              errorMessage:
                  state.createPaymentState.failure?.errorMessage ?? "");
        } else if (state.createPaymentState.status.isHasData) {
          final data = state.selectedPaymentMethod;
          final va = state.createPaymentState.data?.externalData.data ?? "";
          _navigateToPaymentVa(PaymentVAArgument(
            bankName: data?.bankName ?? "",
            virtualAccount: va,
            totalPrices: widget.argument.totalAmount,
          ));
        }
      },
      child: Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDivider(),
              _Title(
                onPressed: () => _navigateToPaymentMethod(context),
              ),
              Container(
                height: 13.h,
                width: double.infinity,
                color: ColorName.textFieldBackgroundGrey,
              ),
              Expanded(
                  child: _Summary(totalPrices: widget.argument.totalAmount)),
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  final data = state.selectedPaymentMethod;
                  return PaymentButton(
                    total: widget.argument.totalAmount,
                    textButton: (data == null) ? "Pilih Pembayaran" : "Bayar",
                    paymentTap: (data == null)
                        ? null
                        : () =>
                            _payment(context, paymentCode: data.paymentCode),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final VoidCallback onPressed;

  const _Title({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        top: 23.h,
        bottom: 15.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Metode Pembayaran",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onPressed,
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorName.orange),
                ),
              ),
            ],
          ),
          SizedBox(height: 11.h),
          const CustomDivider(),
          SizedBox(height: 11.h),
          Row(
            children: [
              Container(
                height: 30.h,
                width: 50.w,
                color: ColorName.orange,
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: BlocBuilder<PaymentCubit, PaymentState>(
                  builder: (context, state) {
                    final data = state.selectedPaymentMethod;
                    return Text(
                      (data == null) ? "Pilih Pembayaran" : data.bankName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  final int totalPrices;

  const _Summary({Key? key, required this.totalPrices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 13.h, left: 17.h, right: 17.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ringkasan Belanja",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                "Total Harga",
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorName.textDarkGrey,
                ),
              ),
              const Spacer(),
              Text(
                totalPrices.toIDR(),
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorName.textDarkGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
