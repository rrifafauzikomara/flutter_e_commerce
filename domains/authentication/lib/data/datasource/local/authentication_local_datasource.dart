import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/error/exception.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';

abstract class AuthenticationLocalDataSources {
  const AuthenticationLocalDataSources();

  Future<bool> cacheOnBoarding();

  Future<bool> getOnBoardingStatus();

  Future<bool> cacheToken({required String token});

  Future<String> getToken();
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
      throw DatabaseException(AppConstants.errorMessage.failedGetOnBoarding);
    }
  }

  @override
  Future<bool> cacheToken({required String token}) async =>
      await sharedPreferences.setString(
        AppConstants.cachedKey.tokenKey,
        token,
      );

  @override
  Future<String> getToken() async {
    try {
      return sharedPreferences.getString(AppConstants.cachedKey.tokenKey) ?? "";
    } catch (_) {
      throw DatabaseException(AppConstants.errorMessage.failedGetToken);
    }
  }
}
