import 'package:cart/domain/entity/request/add_to_chart_entity.dart';
import 'package:cart/domain/entity/response/chart_entity.dart';
import 'package:cart/domain/usecases/add_to_chart_usecase.dart';
import 'package:cart/domain/usecases/delete_chart_usecase.dart';
import 'package:cart/domain/usecases/get_chart_usecase.dart';
import 'package:cart_feature/presentation/bloc/bloc.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';

class CartCubit extends Cubit<CartState> {
  final GetChartUseCase getChartUseCase;
  final AddToChartUseCase addToChartUseCase;
  final DeleteChartUseCase deleteChartUseCase;

  CartCubit({
    required this.getChartUseCase,
    required this.addToChartUseCase,
    required this.deleteChartUseCase,
  }) : super(CartState(
          cartListState: ViewData.initial(),
          addCartState: ViewData.initial(),
          deleteCartState: ViewData.initial(),
        ));

  void deleteProduct({
    required String productId,
    required int amount,
    required int index,
  }) async {
    emit(state.copyWith(deleteCartState: ViewData.loading(message: "Loading")));

    final result = await deleteChartUseCase
        .call(AddToChartEntity(productId: productId, amount: amount));
    return result.fold(
      (failure) => _onFailureDeleteCart(failure),
      (data) => _onSuccessDeleteCart(data, index),
    );
  }

  Future<void> _onFailureDeleteCart(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        deleteCartState: ViewData.error(message: "Error", failure: failure)));
  }

  Future<void> _onSuccessDeleteCart(
    ChartDataEntity data,
    int index,
  ) async {
    if (data.product.isEmpty) {
      emit(state.copyWith(
        deleteCartState: ViewData.noData(message: "No Data"),
        cartListState: ViewData.noData(message: "No Data"),
      ));
    } else {
      /// from tmp
      int amount = 0;

      /// from state
      final totalAmountState = state.totalAmount;
      final selectAllState = state.selectAll;
      final selectProductsState = state.selectProducts;

      /// set data
      final selectedProduct = selectProductsState[index];

      if (selectAllState || selectedProduct) {
        final priceSelected = data.product[index].product.price;
        amount = totalAmountState - priceSelected;
      } else {
        amount = totalAmountState;
      }

      if (!selectedProduct) {
        amount = totalAmountState;
      }

      emit(state.copyWith(
        deleteCartState: ViewData.loaded(data: data),
        cartListState: ViewData.loaded(data: data),
        totalAmount: amount,
      ));
    }
  }

  void addProduct({
    required String productId,
    required int amount,
    required int index,
  }) async {
    emit(state.copyWith(addCartState: ViewData.loading(message: "Loading")));

    final result = await addToChartUseCase
        .call(AddToChartEntity(productId: productId, amount: amount));
    return result.fold(
      (failure) => _onFailureAddCart(failure),
      (data) => _onSuccessAddCart(data, index),
    );
  }

  Future<void> _onFailureAddCart(
    FailureResponse failure,
  ) async {
    emit(state.copyWith(
        addCartState: ViewData.error(message: "Error", failure: failure)));
  }

  Future<void> _onSuccessAddCart(
    ChartDataEntity data,
    int index,
  ) async {
    /// from tmp
    int amount = 0;

    /// from state
    final totalAmountState = state.totalAmount;
    final selectAllState = state.selectAll;
    final selectProductsState = state.selectProducts;

    /// set data
    final selectedProduct = selectProductsState[index];

    if (selectAllState || selectedProduct) {
      final priceSelected = data.product[index].product.price;
      amount = totalAmountState + priceSelected;
    } else {
      amount = totalAmountState;
    }

    if (!selectedProduct) {
      amount = totalAmountState;
    }

    emit(state.copyWith(
      addCartState: ViewData.loaded(data: data),
      cartListState: ViewData.loaded(data: data),
      totalAmount: amount,
    ));
  }

  void selectAll(bool selected) {
    /// from tmp
    int amount = 0;
    final selectProducts = <bool>[];

    /// from state
    final productsState = state.cartListState.data?.product ?? [];

    if (selected) {
      for (var i in productsState) {
        final price = i.product.price;
        final qty = i.quantity;
        amount += (price * qty);
        selectProducts.add(true);
      }

      emit(state.copyWith(
        totalAmount: amount,
        selectAll: selected,
        selectProducts: selectProducts,
      ));
    } else {
      for (var i in productsState) {
        debugPrint("Select Product: ${i.product.name}");
        selectProducts.add(false);
      }

      emit(state.copyWith(
        totalAmount: 0,
        selectAll: false,
        selectProducts: selectProducts,
      ));
    }
  }

  void selectProduct(bool selected, int index) {
    /// from tmp
    int amount = 0;
    final selectProducts = <bool>[];
    bool selectAll = false;

    /// from state
    final productsState = state.cartListState.data?.product ?? [];
    final selectProductsState = state.selectProducts;
    final amountState = state.totalAmount;

    /// set data
    selectProducts.addAll(selectProductsState);

    if (selected) {
      selectProducts[index] = selected;
      for (var i in selectProducts) {
        if (i == true) {
          selectAll = true;
        } else {
          selectAll = false;
          break;
        }
      }

      final qtySelected = productsState[index].quantity;
      final priceSelected = productsState[index].product.price;

      amount = amountState + (priceSelected * qtySelected);

      emit(state.copyWith(
        selectProducts: selectProducts,
        selectAll: selectAll,
        totalAmount: amount,
      ));
    } else {
      final qtySelected = productsState[index].quantity;
      final priceSelected = productsState[index].product.price;

      amount = amountState - (priceSelected * qtySelected);

      selectProducts[index] = selected;
      emit(state.copyWith(
        selectAll: selectAll,
        selectProducts: selectProducts,
        totalAmount: amount,
      ));
    }
  }

  void getCart() async {
    emit(state.copyWith(cartListState: ViewData.loading(message: "Loading")));

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
        cartListState: ViewData.error(message: "Error", failure: failure)));
  }

  Future<void> _onSuccessGetCart(
    ChartDataEntity data,
  ) async {
    if (data.product.isEmpty) {
      emit(state.copyWith(cartListState: ViewData.noData(message: "No Data")));
    } else {
      final selectProducts = <bool>[];

      for (var i in data.product) {
        debugPrint("Product: ${i.product.name}");
        selectProducts.add(false);
      }

      emit(state.copyWith(
        cartListState: ViewData.loaded(data: data),
        totalAmount: 0,
        selectAll: false,
        selectProducts: selectProducts,
      ));
    }
  }
}
