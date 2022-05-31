import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class ChevronButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback? onTap;

  const ChevronButton({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: ColorName.textBlack),
              ),
              Icon(
                Icons.chevron_right,
                color: ColorName.iconGrey,
                size: 24.sp,
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Divider(
            height: 1.5.h,
            thickness: 1.5.h,
            color: ColorName.textFieldBackgroundGrey,
          ),
        ],
      ),
    );
  }
}
