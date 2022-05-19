import 'package:common/utils/navigation/router/auth_router.dart';
import 'package:component/widget/button/custom_button.dart';
import 'package:component/widget/text_field/custom_text_field.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final AuthRouter _authRouter = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorName.orange,
          ),
          onPressed: _authRouter.goBack,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Daftar",
          style: TextStyle(
            color: ColorName.orange,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SizedBox(
            height: 47.h,
          ),
          const CustomTextField(
            labelText: "Username",
            textInputType: TextInputType.name,
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomTextField(
            labelText: "Password",
            obscureText: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomTextField(
            labelText: "Konfirmasi Password",
            obscureText: true,
          ),
          SizedBox(
            height: 39.h,
          ),
          CustomButton(
            buttonText: "Daftar",
            onTap: () {},
          ),
          SizedBox(
            height: 39.h,
          ),
        ],
      ),
    );
  }
}
