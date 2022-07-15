import 'package:bloc_test/bloc_test.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_page/presentation/bloc/banner_bloc/banner_cubit.dart';
import 'package:home_page/presentation/bloc/banner_bloc/banner_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product/domain/usecases/get_banner_usecase.dart';

class MockGetBannerUseCase extends Mock implements GetBannerUseCase {}

void main() => testBannerCubit();

void testBannerCubit() {
  late final GetBannerUseCase _mockGetBannerUseCase;

  setUpAll(() {
    _mockGetBannerUseCase = MockGetBannerUseCase();
  });

  group('Banner Cubit', () {
    blocTest<BannerCubit, BannerState>(
      'emits [] when nothing is added',
      build: () => BannerCubit(getBannerUseCase: _mockGetBannerUseCase),
      expect: () => [],
    );

    blocTest<BannerCubit, BannerState>(
      'emits [loading and loaded] when getBanner is call',
      build: () {
        when(
          () => _mockGetBannerUseCase.call(
            const NoParams(),
          ),
        ).thenAnswer((_) async => const Right([]));
        return BannerCubit(getBannerUseCase: _mockGetBannerUseCase);
      },
      act: (BannerCubit bloc) => bloc.getBanner(),
      expect: () => [
        BannerState(bannerState: ViewData.loading()),
        BannerState(bannerState: ViewData.loaded(data: const [])),
      ],
    );

    blocTest<BannerCubit, BannerState>(
      'emits [loading and error] when getBanner is added',
      build: () {
        when(
          () => _mockGetBannerUseCase.call(
            const NoParams(),
          ),
        ).thenAnswer(
            (_) async => const Left(FailureResponse(errorMessage: '')));
        return BannerCubit(getBannerUseCase: _mockGetBannerUseCase);
      },
      act: (BannerCubit bloc) => bloc.getBanner(),
      expect: () => [
        BannerState(bannerState: ViewData.loading()),
        BannerState(
          bannerState: ViewData.error(
            message: '',
            failure: const FailureResponse(errorMessage: ''),
          ),
        ),
      ],
    );
  });
}
