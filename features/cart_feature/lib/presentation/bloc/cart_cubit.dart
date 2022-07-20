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
  }) async {

  }

  Future<void> _onFailureDeleteCart(
    FailureResponse failure,
  ) async {

  }

  Future<void> _onSuccessDeleteCart(
    ChartDataEntity data,
  ) async {

  }

  void addProduct({
    required String productId,
    required int amount,
  }) async {

  }

  Future<void> _onFailureAddCart(
    FailureResponse failure,
  ) async {

  }

  Future<void> _onSuccessAddCart(
    ChartDataEntity data,
  ) async {

  }

  void selectAll(bool selected) {

  }

  void selectProduct(bool selected, int index) {

  }

  void getCart() async {

  }

  Future<void> _onFailureGetCart(
    FailureResponse failure,
  ) async {

  }

  Future<void> _onSuccessGetCart(
    ChartDataEntity data,
  ) async {

  }
}
