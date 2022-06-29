// import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
// import 'package:dependencies/cached_network_image/cached_network_image.dart';
// import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:product/domain/entity/response/banner_entity.dart';
// import 'package:resources/colors.gen.dart';
//
// class BannerCard extends StatelessWidget {
//   final BannerDataEntity bannerDataEntity;
//   const BannerCard({Key? key, required this.bannerDataEntity}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 9.0),
//       width: 325.w,
//       height: 145.h,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(12.0),
//               ),
//               child: CachedNetworkImage(
//                 width: 150.w,
//                 height: 145.h,
//                 imageUrl: bannerDataEntity.imageUrl!,
//                 placeholder: (context, url) => const Center(
//                     child: CustomCircularProgressIndicator()),
//                 errorWidget: (context, url, error) =>
//                 const Icon(Icons.error),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       bannerDataEntity.headline!,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14.sp,
//                         color: ColorName.textBlack,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8.h,
//                     ),
//                     Text(
//                       bannerDataEntity.caption!,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 3,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12.sp,
//                         color: ColorName.textGrey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
