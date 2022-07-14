import 'package:cart/data/datasource/remote/chart_remote_datasource.dart';
import 'package:cart/data/mapper/chart_mapper.dart';
import 'package:cart/data/repository/chart_repository_impl.dart';
import 'package:cart/domain/repository/chart_repository.dart';
import 'package:cart/domain/usecases/add_to_chart_usecase.dart';
import 'package:cart/domain/usecases/delete_chart_usecase.dart';
import 'package:cart/domain/usecases/get_chart_usecase.dart';
import 'package:dependencies/get_it/get_it.dart';

class ChartDependency {
  ChartDependency() {
    _registerDataSources();
    _registerMapper();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSources() {
    sl.registerLazySingleton<ChartRemoteDataSource>(
      () => ChartRemoteDataSourceImpl(
        dio: sl(),
      ),
    );
  }

  void _registerMapper() => sl.registerLazySingleton<ChartMapper>(
        () => ChartMapper(),
      );

  void _registerRepository() => sl.registerLazySingleton<ChartRepository>(
        () => ChartRepositoryImpl(
          chartRemoteDataSource: sl(),
          mapper: sl(),
        ),
      );

  void _registerUseCases() {
    sl.registerLazySingleton<AddToChartUseCase>(
          () => AddToChartUseCase(
        chartRepository: sl(),
      ),
    );

    sl.registerLazySingleton<GetChartUseCase>(
          () => GetChartUseCase(
        chartRepository: sl(),
      ),
    );

    sl.registerLazySingleton<DeleteChartUseCase>(
          () => DeleteChartUseCase(
        chartRepository: sl(),
      ),
    );
  }
}
