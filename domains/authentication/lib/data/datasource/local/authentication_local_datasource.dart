import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/error/exception.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';

abstract class AuthenticationLocalDataSources {
  const AuthenticationLocalDataSources();

  Future<bool> cacheOnBoarding();

  Future<bool> getOnBoardingStatus();
}

class AuthenticationLocalDataSourcesImpl
    implements AuthenticationLocalDataSources {
  final SharedPreferences sharedPreferences;

  const AuthenticationLocalDataSourcesImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> cacheOnBoarding() async => await sharedPreferences.setBool(
        AppConstants.cachedKey.onBoardingKey,
        true,
      );

  @override
  Future<bool> getOnBoardingStatus() async {
    try {
      return sharedPreferences.getBool(AppConstants.cachedKey.onBoardingKey) ??
          false;
    } catch (_) {
      throw DatabaseException('failed get onboarding status');
    }
  }
}
