import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:product/domain/entity/response/product_category_entity.dart';
import 'package:resources/colors.gen.dart';

class ProductCategoryCard extends StatelessWidget {
  final ProductCategoryEntity productCategoryEntity;

  const ProductCategoryCard({Key? key, required this.productCategoryEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(1.5),
          ),
          child: CachedNetworkImage(
            width: 104.w,
            height: 85.h,
            imageUrl: productCategoryEntity.imageCover,
            placeholder: (context, url) =>
                const Center(child: CustomCircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0),
          child: Text(
            productCategoryEntity.name,
            style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.w700,
              color: ColorName.textBlack,
            ),
          ),
        ),
      ],
    );
  }
}
