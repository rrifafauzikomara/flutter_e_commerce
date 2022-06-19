import 'package:dependencies/get_it/get_it.dart';
import 'package:profile/data/data/remote/profile_remote_datasource.dart';
import 'package:profile/data/mapper/profile_mapper.dart';
import 'package:profile/data/repository/profile_repository_impl.dart';
import 'package:profile/domain/repository/profile_repository.dart';
import 'package:profile/domain/usecases/get_user_usecase.dart';
import 'package:profile/domain/usecases/update_user_usecase.dart';

class ProfileDependency {
  ProfileDependency() {
    _registerDataSources();
    _registerMapper();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSources() {
    sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(
        dio: sl(),
      ),
    );
  }

  void _registerMapper() => sl.registerLazySingleton<ProfileMapper>(
        () => ProfileMapper(),
      );

  void _registerRepository() => sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(
          profileRemoteDataSource: sl(),
          mapper: sl(),
        ),
      );

  void _registerUseCases() {
    sl.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(
        profileRepository: sl(),
      ),
    );
    sl.registerLazySingleton<UpdateUserUseCase>(
          () => UpdateUserUseCase(
        profileRepository: sl(),
      ),
    );
  }
}
