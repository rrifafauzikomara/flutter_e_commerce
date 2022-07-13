import 'package:dependencies/equatable/equatable.dart';

abstract class UpdatePhotoEvent extends Equatable {
  const UpdatePhotoEvent();
}

class UploadImage extends UpdatePhotoEvent {
  const UploadImage();

  @override
  List<Object?> get props => [];
}
