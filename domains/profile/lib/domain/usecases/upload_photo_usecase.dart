import 'dart:io';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:profile/domain/entity/response/user_entity.dart';
import 'package:profile/domain/repository/profile_repository.dart';

class UploadPhotoUseCase extends UseCase<UserEntity, File> {
  final ProfileRepository profileRepository;

  UploadPhotoUseCase({
    required this.profileRepository,
  });

  @override
  Future<Either<FailureResponse, UserEntity>> call(File params) async =>
      await profileRepository.uploadPhoto(image: params);
}
