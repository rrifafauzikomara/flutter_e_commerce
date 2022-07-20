import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: ColorName.lightOrange,
      valueColor: AlwaysStoppedAnimation<Color>(
        ColorName.orange,
      ),
    );
  }
}
