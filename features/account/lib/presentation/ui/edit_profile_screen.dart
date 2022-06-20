import 'package:account/presentation/bloc/user_bloc/user_cubit.dart';
import 'package:account/presentation/bloc/user_bloc/user_state.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/button/custom_button.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:component/widget/text_field/custom_text_field.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
      body: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
        final status = state.userState.status;
        if (status.isHasData) {
          nameController.text = state.userState.data!.fullName;
          addressController.text = state.userState.data!.simpleAddress;
        }
      }, builder: (context, state) {
        final status = state.userState.status;
        if (status.isLoading) {
          return const Center(child: CustomCircularProgressIndicator());
        } else if (status.isHasData) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    child: CachedNetworkImage(
                      width: 72.w,
                      height: 72.w,
                      imageUrl: state.userState.data!.imageUrl,
                      placeholder: (context, url) => const Center(
                          child: CustomCircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    right: 0.38.sw,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {},
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
              CustomTextField(
                labelText: "Nama",
                textInputType: TextInputType.name,
                controller: nameController,
              ),
              SizedBox(
                height: 19.h,
              ),
              CustomTextField(
                labelText: "Alamat",
                textInputType: TextInputType.name,
                controller: addressController,
              ),
              SizedBox(
                height: 46.h,
              ),
              CustomButton(
                buttonText: "Simpan",
                onTap: () {},
              ),
            ],
          );
        } else if (status.isError) {
          return Center(child: Text(state.userState.message));
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
