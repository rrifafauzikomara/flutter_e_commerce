import 'package:common/utils/extensions/money_extension.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/button/custom_button.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:detail_product/presentation/bloc/product_detail_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:common/utils/navigation/argument/arguments.dart';
import 'package:product/domain/entity/response/product_detail_entity.dart';
import 'package:product/domain/entity/response/seller_data_entity.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';
import 'package:dependencies/html/html.dart';

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
    _getProductDetail();
  }

  void _getProductDetail() {
    context.read<ProductDetailCubit>().getProduct(widget.argument.productId);
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
      body: Center(
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            final productState = state.productState.status;
            if (productState.isLoading) {
              return const CustomCircularProgressIndicator();
            } else if (productState.isError) {
              return Text(state.productState.failure!.errorMessage);
            } else if (productState.isHasData) {
              final productData =
                  state.productState.data ?? const ProductDetailDataEntity();
              return Stack(
                children: [
                  ListView(
                    children: [
                      CachedNetworkImage(
                        imageUrl: productData.imageUrl,
                        fit: BoxFit.contain,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          top: 10.h,
                          bottom: 40.h,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    productData.price.toIDR(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.sp,
                                      color: ColorName.textDarkGrey,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: ColorName.orange,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              productData.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: ColorName.textDarkGrey,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "${productData.soldCount}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: ColorName.textDarkGrey,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            const _Seller(),
                            SizedBox(height: 20.h),
                            Text(
                              "Informasi Produk",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: ColorName.textDarkGrey,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Text(
                                  "Kategori",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: ColorName.textDarkGrey,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  productData.category.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: ColorName.orange,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 23.h),
                            Container(
                              color: ColorName.textFieldBackgroundGrey,
                              width: double.infinity,
                              height: 1.h,
                            ),
                            SizedBox(height: 19.h),
                            Text(
                              "Deskripsi Produk",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: ColorName.textDarkGrey,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            HtmlWidget(
                              productData.description,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: ColorName.textDarkGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: ColorName.textFieldBackgroundGrey,
                          width: double.infinity,
                          height: 1.h,
                        ),
                        Container(
                          color: ColorName.white,
                          padding: EdgeInsets.only(
                              top: 10.h, bottom: 8.h, left: 15.h, right: 15.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  buttonText: "Beli Langsung",
                                  onTap: () {},
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Expanded(
                                child: CustomButton(
                                  buttonText: "Keranjang",
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class _Seller extends StatelessWidget {
  const _Seller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          final sellerState = state.sellerState.status;
          if (sellerState.isLoading) {
            return const CustomCircularProgressIndicator();
          } else if (sellerState.isError) {
            return Text(state.sellerState.failure!.errorMessage);
          } else if (sellerState.isHasData) {
            final sellerDetail =
                state.sellerState.data ?? const SellerDataEntity();
            return Column(
              children: [
                Container(
                  color: ColorName.textFieldBackgroundGrey,
                  width: double.infinity,
                  height: 1.h,
                ),
                SizedBox(height: 13.h),
                Row(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: sellerDetail.imageUrl,
                        height: 40.w,
                        width: 40.w,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sellerDetail.fullName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: ColorName.textDarkGrey,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          sellerDetail.city,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: ColorName.textDarkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 13.h),
                Container(
                  color: ColorName.textFieldBackgroundGrey,
                  width: double.infinity,
                  height: 1.h,
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
