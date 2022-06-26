import 'dart:io';

import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class UpdatePhotoState extends Equatable {
  final ViewData<File> updatePhotoState;

  const UpdatePhotoState({
    required this.updatePhotoState,
  });

  UpdatePhotoState copyWith({
    ViewData<File>? updatePhotoState,
  }) {
    return UpdatePhotoState(
      updatePhotoState: updatePhotoState ?? this.updatePhotoState,
    );
  }

  @override
  List<Object?> get props => [updatePhotoState];
}
