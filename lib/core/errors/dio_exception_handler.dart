import 'package:dio/dio.dart';
import 'package:exogo/core/errors/exceptions.dart';

class DioExceptionHandler {
  static Never handle({required DioException e, String? errorMessage}) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      throw NetworkExceptions('Connection timed out.');
    } else if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
      throw UnauthorizedException(
        e.response?.data["message"] ??
            errorMessage ??
            'Request time out, Please try again.',
      );
    } else if (e.response?.statusCode == 404) {
      throw ServiceExceptions('Server not found.');
    } else if (e.response?.statusCode == 500) {
      throw ServiceExceptions('Internal server error.');
    } else if (e.response?.statusCode == 429) {
      throw ServiceExceptions(
        'Too many requests. Please try again after a minute',
      );
    } else {
      throw UnknownExceptions(e.message ?? 'Unexpected error');
    }
  }
}
