import 'package:common/utils/state/view_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/presentation/bloc/home_bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(homeState: ViewData.loaded(data: 0)));

  void changeTab({required int tabIndex}) => emit(
        HomeState(
          homeState: ViewData.loaded(data: tabIndex),
        ),
      );
}
