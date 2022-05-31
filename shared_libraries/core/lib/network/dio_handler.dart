import 'package:common/utils/constants/app_constants.dart';
import 'package:core/network/api_interceptors.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';

class DioHandler {
  final String apiBaseUrl;
  late SharedPreferences sharedPreferences;

  DioHandler({
    required this.apiBaseUrl,
    required this.sharedPreferences,
  });

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    options.headers = _defaultHeader();
    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors());

    return dio;
  }

  Map<String, dynamic> _defaultHeader() {
    String? authorizationToken = sharedPreferences.getString(
      AppConstants.cachedKey.tokenKey,
    );
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['Authorization'] = authorizationToken ?? "";
    return headers;
  }
}
