import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class HomeState extends Equatable {
  final ViewData<int> homeState;

  const HomeState({
    required this.homeState,
  });

  HomeState copyWith({
    ViewData<int>? homeState,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
    );
  }

  @override
  List<Object?> get props => [homeState];
}
