import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:product/domain/entity/response/product_entity.dart';
import 'package:resources/colors.gen.dart';
import 'package:common/utils/extensions/money_extension.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductCard({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          width: 127.w,
          height: 195.h,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: CachedNetworkImage(
                    height: 120.h,
                    width: 127.w,
                    imageUrl: productEntity.imageUrl,
                    placeholder: (context, url) =>
                        const Center(child: CustomCircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    productEntity.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: ColorName.textGrey,
                    ),
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    productEntity.price.toIDR(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Terjual ${productEntity.soldCount} | ${productEntity.seller.city}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 8.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
