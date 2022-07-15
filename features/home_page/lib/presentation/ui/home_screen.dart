import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/card/banner_card.dart';
import 'package:component/widget/card/product_card.dart';
import 'package:component/widget/card/product_category_card.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:home_page/presentation/bloc/banner_bloc/banner_cubit.dart';
import 'package:home_page/presentation/bloc/banner_bloc/banner_state.dart';
import 'package:home_page/presentation/bloc/product_bloc/product_cubit.dart';
import 'package:home_page/presentation/bloc/product_bloc/product_state.dart';
import 'package:home_page/presentation/bloc/product_category_bloc/product_category_cubit.dart';
import 'package:home_page/presentation/bloc/product_category_bloc/product_category_state.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      ),
      body: ListView(
        children: [
          Container(
            width: 325.w,
            height: 145.h,
            margin: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: BlocBuilder<BannerCubit, BannerState>(
              builder: (context, state) {
                final status = state.bannerState.status;
                if (status.isLoading) {
                  return const Center(child: CustomCircularProgressIndicator());
                } else if (status.isHasData) {
                  final banners = state.bannerState.data ?? [];
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: banners.length,
                    itemBuilder: (context, index) {
                      return BannerCard(
                        bannerDataEntity: banners[index],
                      );
                    },
                  );
                } else if (status.isError) {
                  return Center(child: Text(state.bannerState.message));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, top: 25.h, bottom: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Produk Terkait",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorName.textBlack,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Lihat semua",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorName.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 195.h,
            margin: const EdgeInsets.only(left: 8.0),
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                final status = state.productState.status;
                if (status.isLoading) {
                  return const Center(child: CustomCircularProgressIndicator());
                } else if (status.isHasData) {
                  final product = state.productState.data?.data ?? [];
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        productEntity: product[index],
                      );
                    },
                  );
                } else if (status.isError) {
                  return Center(child: Text(state.productState.message));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, top: 27.h, bottom: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kategori Pilihan",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorName.textBlack,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Lihat semua",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorName.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
            builder: (context, state) {
              final status = state.productCategoryState.status;
              if (status.isLoading) {
                return const Center(child: CustomCircularProgressIndicator());
              } else if (status.isHasData) {
                final productCategory = state.productCategoryState.data ?? [];
                final productCategoryLength =
                productCategory.length > 3 ? 3 : productCategory.length;
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: productCategoryLength,
                  itemBuilder: (_, index) => ProductCategoryCard(
                    productCategoryEntity: productCategory[index],
                  ),
                );
              } else if (status.isError) {
                return Center(child: Text(state.productCategoryState.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
