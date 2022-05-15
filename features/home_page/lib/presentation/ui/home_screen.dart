import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 9.0),
                  color: ColorName.orange,
                  width: 325.w,
                  height: 145.h,
                  child: Assets.images.logo.logo.svg(),
                );
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: 127.w,
                      height: 195.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            child: CachedNetworkImage(
                              height: 120.h,
                              width: 127.w,
                              imageUrl:
                                  "https://cf.shopee.co.id/file/aa8afefde6c5a3293dfc9772d3d54205",
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Jam Bekker vintage 1998",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: ColorName.textGrey,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Rp 100.000",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: ColorName.textGrey,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Terjual 889 | Kota Tangerang",
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
                );
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
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (_, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(1.5),
                  ),
                  child: CachedNetworkImage(
                    width: 104.w,
                    height: 85.h,
                    imageUrl:
                        "https://cf.shopee.co.id/file/aa8afefde6c5a3293dfc9772d3d54205",
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Text(
                    "Makanan & Minuman",
                    style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorName.textBlack),
                  ),
                ),
              ],
            ),
            itemCount: 6,
          )
        ],
      ),
    );
  }
}
