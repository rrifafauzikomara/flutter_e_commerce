import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final BorderRadiusGeometry buttonBorderRadius;
  final String buttonText;
  final GestureTapCallback? onTap;

  const CustomButton({
    Key? key,
    this.buttonColor = ColorName.orange,
    this.buttonText = "",
    this.buttonBorderRadius = const BorderRadius.all(Radius.circular(1.5)),
    this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(1.5))),
        child: Text(
          buttonText,
          style: TextStyle(
            color: ColorName.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
