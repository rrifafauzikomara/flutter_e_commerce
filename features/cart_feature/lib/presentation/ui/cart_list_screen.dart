import 'package:cart_feature/presentation/bloc/bloc.dart';
import 'package:common/utils/navigation/router/cart_router.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/card/cart_card.dart';
import 'package:component/widget/check_box/custom_check_box.dart';
import 'package:component/widget/divider/custom_divider.dart';
import 'package:component/widget/toast/custom_toast.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:component/widget/button/payment_button.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({Key? key}) : super(key: key);

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final _cartRouter = sl<CartRouter>();

  @override
  void initState() {
    super.initState();
    _getCart(context);
  }

  void _getCart(BuildContext context) {
    context.read<CartCubit>().getCart();
  }

  void _selectAll(BuildContext context, {required bool selected}) {
    context.read<CartCubit>().selectAll(selected);
  }

  void _selectProduct(
    BuildContext context, {
    required bool selected,
    required int index,
  }) {
    context.read<CartCubit>().selectProduct(selected, index);
  }

  void _addProduct(
    BuildContext context, {
    required String productId,
    required int amount,
    required int index,
  }) {
    context.read<CartCubit>().addProduct(
          productId: productId,
          amount: amount,
          index: index,
        );
  }

  void _deleteProduct(
    BuildContext context, {
    required String productId,
    required int amount,
    required int index,
  }) {
    context.read<CartCubit>().deleteProduct(
          productId: productId,
          amount: amount,
          index: index,
        );
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
              child: Container(
                alignment: Alignment.centerLeft,
                height: 35.h,
                child: Text(
                  "Keranjang",
                  style: TextStyle(
                    color: ColorName.orange,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 19.w,
            ),
            InkWell(
              onTap: () {},
              child: Assets.images.icon.icFavoriteNotSelected
                  .svg(width: 24.w, height: 24.h),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: ColorName.orange),
      ),
      body: Center(
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            final addCartState = state.addCartState;
            if (addCartState.status.isError) {
              CustomToast.showErrorToast(
                errorMessage: state.addCartState.failure!.errorMessage,
              );
            }

            final deleteCartState = state.deleteCartState;
            if (deleteCartState.status.isError) {
              CustomToast.showErrorToast(
                errorMessage: state.deleteCartState.failure!.errorMessage,
              );
            }
          },
          builder: (context, state) {
            final addCartLoading = state.addCartState.status.isLoading;
            final deleteCartLoading = state.deleteCartState.status.isLoading;
            if (state.cartListState.status.isLoading) {
              return const CustomCircularProgressIndicator();
            } else if (state.cartListState.status.isError) {
              return Text(state.cartListState.failure!.errorMessage);
            } else if (state.cartListState.status.isNoData) {
              return Text(state.cartListState.message);
            } else if (state.cartListState.status.isHasData) {
              final products = state.cartListState.data?.product ?? [];
              final selectProducts = state.selectProducts;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomDivider(),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 8.h,
                    ),
                    child: Row(
                      children: [
                        CustomCheckBox(
                          value: state.selectAll,
                          onChanged: (bool? value) => _selectAll(
                            context,
                            selected: value ?? false,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        const Text("Pilih Semua"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final cart = products[index];
                        final selectProduct = selectProducts[index];
                        return CartCard(
                          cart: cart,
                          value: selectProduct,
                          selectProductChanged: (bool? value) => _selectProduct(
                            context,
                            selected: value ?? false,
                            index: index,
                          ),
                          addProductChanged: () => _addProduct(
                            context,
                            productId: cart.product.id,
                            amount: 1,
                            index: index,
                          ),
                          deleteProductChanged: () => _deleteProduct(
                            context,
                            productId: cart.product.id,
                            amount: 1,
                            index: index,
                          ),
                          loadingAddProduct: addCartLoading,
                          loadingDeleteProduct: deleteCartLoading,
                        );
                      },
                    ),
                  ),
                  PaymentButton(
                    total: state.totalAmount,
                    textButton: "Beli",
                    paymentTap: () =>
                        _cartRouter.navigateToPayment(state.totalAmount),
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
