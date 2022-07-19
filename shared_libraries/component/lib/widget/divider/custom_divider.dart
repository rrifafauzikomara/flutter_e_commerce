import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const CustomDivider({
    Key? key,
    this.height = 1,
    this.width = double.infinity,
    this.color = ColorName.textFieldBackgroundGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height.h,
    );
  }
}
