import 'package:component/widget/divider/custom_divider.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class PaymentMethodCard extends StatelessWidget {
  final String bankName;
  final VoidCallback selectPaymentMethod;

  const PaymentMethodCard({
    Key? key,
    required this.bankName,
    required this.selectPaymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectPaymentMethod,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                height: 30.h,
                width: 50.w,
                color: ColorName.orange,
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Text(
                  bankName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
          SizedBox(height: 10.h),
          const CustomDivider(),
        ],
      ),
    );
  }
}
