import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/card/history_card.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:payment_feature/presentation/bloc/history/bloc.dart';
import 'package:resources/colors.gen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: AppBar(
        backgroundColor: ColorName.white,
        elevation: 0.0,
        title: Container(
          alignment: Alignment.centerLeft,
          height: 35.h,
          child: Text(
            "Riwayat Belanja",
            style: TextStyle(
              color: ColorName.orange,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: ColorName.orange),
      ),
      body: Center(
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            if (state.historyState.status.isLoading) {
              return const CustomCircularProgressIndicator();
            } else if (state.historyState.status.isError) {
              return Text(state.historyState.message);
            } else if (state.historyState.status.isNoData) {
              return Text(state.historyState.message);
            } else if (state.historyState.status.isHasData) {
              final histories = state.historyState.data?.data ?? [];
              return ListView.builder(
                itemCount: histories.length,
                itemBuilder: (context, index) {
                  final history = histories[index];

                  final productLength = history.productData.length;
                  int totalProduct = 0;
                  if (productLength > 1) {
                    totalProduct = productLength - 1;
                  } else {
                    totalProduct = productLength;
                  }
                  return HistoryCard(
                    statusPayment: history.paymentTransaction.statusPayment,
                    createdAt: history.createdAt,
                    productUrl: history.productData.first.product.imageUrl,
                    productName: history.productData.first.product.name,
                    totalProduct: totalProduct,
                    productPrice: history.productData.first.product.price,
                  );
                },
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
