import 'package:dio/dio.dart';

abstract class BaseApiService {
  Future<Response> getRequest(String url, {Map<String, dynamic>? queryParams});
  Future<Response> postRequest(
    String url, {
    Map<String, dynamic>? queryParams,
    dynamic data,
  });
}
