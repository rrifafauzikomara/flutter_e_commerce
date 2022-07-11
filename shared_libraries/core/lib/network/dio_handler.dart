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
    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors(sharedPreferences: sharedPreferences));

    return dio;
  }


}