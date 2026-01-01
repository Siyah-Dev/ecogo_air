import 'package:dio/dio.dart';
import 'package:exogo/core/network/base_api_service.dart';

class DioApiService implements BaseApiService {
  DioApiService(this.dio);
  final Dio dio;

  @override
  Future<Response> getRequest(String url, {Map<String, dynamic>? queryParams, dynamic data}) async {
    return await dio.get(url, queryParameters: queryParams, data: data);
  }

  @override
  Future<Response> postRequest(
    String url, {
    Map<String, dynamic>? queryParams,

    dynamic data,
  }) async {
    return dio.post(url, queryParameters: queryParams, data: data);
  }
}
