import 'package:common/utils/state/view_data_state.dart';
import 'package:payment/domain/entity/response/product_history_entity.dart';

class HistoryState {
  final ViewData<HistoryEntity> historyState;

  const HistoryState({
    required this.historyState,
  });

  HistoryState copyWith({
    ViewData<HistoryEntity>? historyState,
  }) {
    return HistoryState(
      historyState: historyState ?? this.historyState,
    );
  }
}
