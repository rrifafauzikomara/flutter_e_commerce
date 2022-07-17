import 'package:dependencies/get_it/get_it.dart';
import 'package:payment/data/datasource/remote/payment_remote_datasource.dart';
import 'package:payment/data/mapper/payment_mapper.dart';
import 'package:payment/data/repository/payment_repository_impl.dart';
import 'package:payment/domain/repository/payment_repository.dart';
import 'package:payment/domain/usecases/get_all_payment_method_usecase.dart';

class PaymentDependency {
  PaymentDependency() {
    _registerDataSources();
    _registerMapper();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSources() {
    sl.registerLazySingleton<PaymentRemoteDataSource>(
      () => PaymentRemoteDataSourceImpl(
        dio: sl(),
      ),
    );
  }

  void _registerMapper() => sl.registerLazySingleton<PaymentMapper>(
        () => PaymentMapper(),
      );

  void _registerRepository() => sl.registerLazySingleton<PaymentRepository>(
        () => PaymentRepositoryImpl(
          remoteDataSource: sl(),
          mapper: sl(),
        ),
      );

  void _registerUseCases() {
    sl.registerLazySingleton<GetAllPaymentMethodUseCase>(
      () => GetAllPaymentMethodUseCase(
        repository: sl(),
      ),
    );
  }
}
