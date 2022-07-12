import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:common/utils/navigation/argument/arguments.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class DetailProductScreen extends StatefulWidget {
  final DetailProductArgument argument;

  const DetailProductScreen({Key? key, required this.argument})
      : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  void initState() {
    super.initState();
    print("${widget.argument.productId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: AppBar(
        backgroundColor: ColorName.white,
        elevation: 0.0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 35.h,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: ColorName.iconGrey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.5),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 13.0,
                      vertical: 5.0,
                    ),
                    hintText: "Sepatu Olahraga",
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
              ),
            ),
            SizedBox(
              width: 19.w,
            ),
            InkWell(
              onTap: () {},
              child: Assets.images.icon.cart.svg(width: 24.w, height: 24.h),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: ColorName.orange),
      ),
    );
  }
}
