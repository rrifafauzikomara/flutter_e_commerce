import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:cart/domain/usecases/get_chart_usecase.dart';
import 'package:cart_feature/presentation/bloc/bloc.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';

class CartCubit extends Cubit<CartState> {
  final GetChartUseCase getChartUseCase;

  CartCubit({
    required this.getChartUseCase,
  }) : super(CartState(
          cartListState: ViewData.initial(),
        ));

  void selectAll(bool selected) {
    int amount = 0;
    final selectProducts = state.selectProducts;
    final newSelectProducts = <bool>[];
    final data = state.cartListState.data;

    if (selected) {
      final products = data?.product ?? [];

      for (var i in products) {
        amount += i.product.price;
      }

      for (var i in selectProducts) {
        debugPrint("Set to True: $i");
        newSelectProducts.add(true);
      }

      emit(state.copyWith(
        selectAll: selected,
        totalAmount: amount,
        selectProducts: newSelectProducts,
        cartListState: ViewData.loaded(data: data),
      ));
    } else {
      amount = 0;

      for (var i in selectProducts) {
        debugPrint("Set to False: $i");
        newSelectProducts.add(false);
      }

      emit(state.copyWith(
        selectAll: selected,
        totalAmount: amount,
        selectProducts: newSelectProducts,
        cartListState: ViewData.loaded(data: data),
      ));
    }
  }

  void selectProduct(bool selected, int index) {
    final selectProducts = state.selectProducts;
    final newSelectProducts = <bool>[];
    final data = state.cartListState.data;
    var totalAmount = state.totalAmount;
    var selectAll = false;

    final products = data?.product ?? [];
    final selectedAmount = products[index].product.price;
    newSelectProducts.addAll(selectProducts);
    if (selected) {
      final total = totalAmount + selectedAmount;
      totalAmount = total;
      newSelectProducts[index] = true;
    } else {
      final total = totalAmount - selectedAmount;
      totalAmount = total;
      newSelectProducts[index] = false;
    }

    for (var i in newSelectProducts) {
      if (i) {
        selectAll = true;
      } else {
        selectAll = false;
        break;
      }
    }

    emit(state.copyWith(
      selectAll: selectAll,
      totalAmount: totalAmount,
      selectProducts: newSelectProducts,
      cartListState: ViewData.loaded(data: data),
    ));
  }

  void getCart() async {
    emit(state.copyWith(cartListState: ViewData.loading(message: 'Loading')));

    final result = await getChartUseCase.call(const NoParams());
    return result.fold(
      (failure) => _onFailureGetCart(failure),
      (data) => _onSuccessGetCart(data),
    );
  }

  Future<void> _onFailureGetCart(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        cartListState:
            ViewData.error(message: failure.errorMessage, failure: failure)));
  }

  Future<void> _onSuccessGetCart(
    ChartDataEntity data,
  ) async {
    if (data.product.isEmpty) {
      emit(state.copyWith(cartListState: ViewData.noData(message: "No Data")));
    } else {
      final selectProducts = <bool>[];
      for (var i in data.product) {
        debugPrint("Product Name: ${i.product.name}");
        selectProducts.add(false);
      }
      emit(state.copyWith(
        cartListState: ViewData.loaded(data: data),
        selectAll: false,
        selectProducts: selectProducts,
        totalAmount: 0,
      ));
    }
  }
}
