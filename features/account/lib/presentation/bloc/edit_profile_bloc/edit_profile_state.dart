import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class EditProfileState extends Equatable {
  final ViewData editProfileState;

  const EditProfileState({
    required this.editProfileState,
  });

  EditProfileState copyWith({
    ViewData? editProfileState,
  }) {
    return EditProfileState(
      editProfileState: editProfileState ?? this.editProfileState,
    );
  }

  @override
  List<Object?> get props => [editProfileState];
}
