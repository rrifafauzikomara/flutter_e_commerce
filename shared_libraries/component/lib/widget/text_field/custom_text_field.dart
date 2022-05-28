import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? errorText;
  final TextInputType? textInputType;
  final bool obscureText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    this.labelText = "",
    this.hintText = "",
    this.textInputType,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.errorText,
  }) : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: ColorName.textDarkBlue,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        TextField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.5),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 10.0,
            ),
            errorText: errorText,
            hintText: hintText,
            hintStyle: TextStyle(
              color: ColorName.textFieldHintGrey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            hoverColor: ColorName.orange,
            focusColor: ColorName.orange,
            filled: true,
            fillColor: ColorName.textFieldBackgroundGrey,
          ),
        ),
      ],
    );
  }
}
