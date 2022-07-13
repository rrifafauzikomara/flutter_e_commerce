import 'dart:io';
import 'package:account/presentation/bloc/update_photo_bloc/update_photo_event.dart';
import 'package:account/presentation/bloc/update_photo_bloc/update_photo_state.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/image_picker/image_picker.dart';
import 'package:profile/domain/usecases/upload_photo_usecase.dart';

class UpdatePhotoBloc extends Bloc<UpdatePhotoEvent, UpdatePhotoState> {
  final ImagePicker imagePicker;
  final UploadPhotoUseCase uploadPhotoUsecase;

  UpdatePhotoBloc({
    required this.imagePicker,
    required this.uploadPhotoUsecase,
  }) : super(
          UpdatePhotoState(
            updatePhotoState: ViewData.initial(),
          ),
        ) {
    on<UploadImage>((event, emit) async {
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (image != null) {
        emit(
          UpdatePhotoState(
            updatePhotoState: ViewData.loading(),
          ),
        );

        final uploadPhoto = await uploadPhotoUsecase.call(File(image.path));
        uploadPhoto.fold(
          (failure) => emit(
            UpdatePhotoState(
              updatePhotoState: ViewData.error(
                message: failure.errorMessage,
                failure: failure,
              ),
            ),
          ),
          (_) => emit(
            UpdatePhotoState(
              updatePhotoState: ViewData.loaded(data: File(image.path)),
            ),
          ),
        );
      } else {
        emit(
          UpdatePhotoState(
            updatePhotoState: ViewData.loaded(),
          ),
        );
      }
    });
  }
}
