import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: ColorName.whiteBackground,
        child: Center(
          child: Assets.images.onboarding.onBoarding1.svg(
            width: 147.w,
            height: 100.h,
          ),
        ),
      ),
    );
  }
}
