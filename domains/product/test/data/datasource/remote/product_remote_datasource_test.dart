import 'dart:io';
import 'package:common/utils/error/failure_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product/data/datasource/remote/product_remote_datasource.dart';
import '../../../helper/json_reader.dart';

void main() => testProductRemoteDatasourceTest();

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class RequestOptionMock extends Mock implements RequestOptions {}

void testProductRemoteDatasourceTest() {
  final Dio dio = Dio();
  late DioAdapterMock dioAdapterMock;
  late final ProductRemoteDataSource productRemoteDataSource;

  setUpAll(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    productRemoteDataSource = ProductRemoteDataSourceImpl(dio: dio);
    registerFallbackValue(RequestOptionMock());
  });

  test('''Success \t
    GIVEN fetch data from api with 200 status code
    WHEN getBanner method executed
    THEN return List<BannerDataDto>
    ''', () async {
    final responseJson = TestHelper.readJson('helper/json/banner.json');
    final httpResponse =
        ResponseBody.fromString(responseJson, HttpStatus.ok, headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    });
    when(() => dioAdapterMock.fetch(any(), any(), any()))
        .thenAnswer((invocation) async => httpResponse);

    final result = await productRemoteDataSource.getBanner();

    expect(result.data!.length, 1);
  });
  test('''Success \t
    GIVEN fetch data from api with 500 status code
    WHEN getBanner method executed
    THEN throwsException
    ''', () async {
    //GIVEN
    when(() => dioAdapterMock.fetch(any(), any(), any())).thenThrow(
        const FailureResponse(errorMessage: "internal server error"));

    expect(
        // WHEN
        () => productRemoteDataSource.getBanner(),
        // THEN
        throwsException);
  });
}
