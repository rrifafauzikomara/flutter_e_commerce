import 'package:component/widget/divider/custom_divider.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';
import 'package:common/utils/extensions/money_extension.dart';

class HistoryCard extends StatelessWidget {
  final String statusPayment;
  final String createdAt;
  final String productUrl;
  final String productName;
  final int totalProduct;
  final int productPrice;

  const HistoryCard({
    Key? key,
    required this.statusPayment,
    required this.createdAt,
    required this.productUrl,
    required this.productName,
    required this.totalProduct,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double rounded = 10;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDivider(),
        SizedBox(height: 10.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rounded),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(rounded),
                      topRight: Radius.circular(rounded),
                    ),
                  ),
                  height: 21.h,
                  alignment: Alignment.center,
                  child: Text(
                    statusPayment,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 8.sp,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        createdAt,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const CustomDivider(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 14.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              child: CachedNetworkImage(
                                height: 64.w,
                                width: 64.w,
                                imageUrl: productUrl,
                                placeholder: (context, url) => const Center(
                                    child: CustomCircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Center(child: Icon(Icons.error)),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: SizedBox(
                                height: 64.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        productName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10.sp,
                                          color: ColorName.textDarkGrey,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "$totalProduct Barang",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      productPrice.toIDR(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp,
                                        color: ColorName.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CustomDivider(),
                      SizedBox(height: 7.h),
                      Text(
                        "[Tangerang] Pengiriman berhasil sampai tujuan diantar oleh J&T dan paket telah diterima oleh John Doe.",
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorName.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        const CustomDivider(),
      ],
    );
  }
}
