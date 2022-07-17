import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:component/widget/check_box/custom_check_box.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';
import 'package:common/utils/extensions/money_extension.dart';

class CartCard extends StatelessWidget {
  final ProductsChartEntity cart;
  final bool value;
  final ValueChanged<bool?>? selectProductChanged;
  final VoidCallback addProductChanged;
  final VoidCallback deleteProductChanged;
  final bool loadingAddProduct;
  final bool loadingDeleteProduct;

  const CartCard({
    Key? key,
    required this.cart,
    required this.value,
    required this.selectProductChanged,
    required this.addProductChanged,
    required this.deleteProductChanged,
    required this.loadingAddProduct,
    required this.loadingDeleteProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Divider(),
        Container(
          margin: EdgeInsets.only(
            top: 21.h,
            bottom: 18.h,
            left: 16.h,
            right: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.userInfo.name,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 10.sp,
                  color: ColorName.textDarkGrey,
                ),
              ),
              Text(
                cart.product.userInfo.city,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 8.sp,
                  color: ColorName.textDarkGrey,
                ),
              ),
              SizedBox(height: 14.h),
              Row(
                children: [
                  CustomCheckBox(
                    value: value,
                    onChanged: selectProductChanged,
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              child: CachedNetworkImage(
                                height: 64.w,
                                width: 64.w,
                                imageUrl: cart.product.imageUrl,
                                placeholder: (context, url) => const Center(
                                    child: CustomCircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Center(child: Icon(Icons.error)),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cart.product.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.sp,
                                      color: ColorName.textDarkGrey,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    cart.product.price.toIDR(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.sp,
                                      color: ColorName.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.w),
                          height: 35.h,
                          width: double.infinity,
                          child: TextField(
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
                                vertical: 5.0,
                              ),
                              hintText: "Catatan Untuk Toko",
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  const Spacer(),
                  loadingDeleteProduct
                      ? const SizedBox()
                      : IconButton(
                          onPressed: deleteProductChanged,
                          icon: const Icon(Icons.remove),
                        ),
                  Text(cart.quantity.toString()),
                  loadingAddProduct
                      ? const SizedBox()
                      : IconButton(
                          onPressed: addProductChanged,
                          icon: const Icon(
                            Icons.add,
                            color: ColorName.orange,
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
        const _Divider(),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.textFieldBackgroundGrey,
      width: double.infinity,
      height: 1.h,
    );
  }
}
