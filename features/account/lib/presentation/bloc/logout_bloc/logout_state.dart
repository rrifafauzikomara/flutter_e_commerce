import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class LogoutState extends Equatable {
  final ViewData<bool> logoutState;

  const LogoutState({
    required this.logoutState,
  });

  LogoutState copyWith({
    ViewData<bool>? logoutState,
  }) {
    return LogoutState(
      logoutState: logoutState ?? this.logoutState,
    );
  }

  @override
  List<Object?> get props => [logoutState];
}
