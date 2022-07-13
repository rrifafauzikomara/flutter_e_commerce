import 'package:chart/data/datasource/remote/chart_remote_datasource.dart';
import 'package:chart/data/mapper/chart_mapper.dart';
import 'package:chart/data/repository/chart_repository_impl.dart';
import 'package:chart/domain/repository/chart_repository.dart';
import 'package:chart/domain/usecases/add_to_chart_usecase.dart';
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
  }
}
