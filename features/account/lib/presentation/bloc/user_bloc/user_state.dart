import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:profile/domain/entity/response/user_entity.dart';

class UserState extends Equatable {
  final ViewData<UserEntity> userState;

  const UserState({
    required this.userState,
  });

  UserState copyWith({
    ViewData<UserEntity>? userState,
  }) {
    return UserState(
      userState: userState ?? this.userState,
    );
  }

  @override
  List<Object?> get props => [userState];
}
