import 'package:component/widget/button/custom_button.dart';
import 'package:component/widget/text_field/custom_text_field.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: AppBar(
        backgroundColor: ColorName.white,
        elevation: 0.0,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: ColorName.orange,
        ),
        title: Text(
          "Data Diri",
          style: TextStyle(
            color: ColorName.orange,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 72.w,
                height: 72.w,
                decoration: const BoxDecoration(
                  color: ColorName.iconGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0.38.sw,
                bottom: 0,
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: 15.w,
                    height: 15.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                      border: Border.all(
                        color: ColorName.iconWhite,
                      ),
                    ),
                    child: Assets.images.icon.edit.svg(
                      width: 8.w,
                      height: 8.w,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomTextField(
            labelText: "Nama",
            textInputType: TextInputType.name,
          ),
          SizedBox(
            height: 19.h,
          ),
          const CustomTextField(
            labelText: "Alamat",
            textInputType: TextInputType.name,
          ),
          SizedBox(
            height: 46.h,
          ),
          CustomButton(
            buttonText: "Simpan",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
