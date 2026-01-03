import 'package:dio/dio.dart';
import 'package:exogo/core/errors/dio_exception_handler.dart';
import 'package:exogo/core/errors/exceptions.dart';
import 'package:exogo/features/home/data/model/flight_model.dart';
import 'package:exogo/features/home/data/model/flight_search_request_model.dart';

class FlightRemoteDatasource {
  FlightRemoteDatasource(this._dio);

  final Dio _dio;

  Future<bool> searchFlights(FlightSearchRequestModel request) async {
    try {
      final response = await _dio.post(
        'airports/search',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw ServiceExceptions('Failed to fetch airport data');
      }
    } on DioException catch (e) {
      throw ServiceExceptions(DioExceptionHandler.handle(e: e));
    } catch (e) {
      throw UnknownExceptions('Unexpected error');
    }
  }

  Future<List<FlightModel>> getFlights(String tui) async {
    try {
      final response = await _dio.get('search/search/$tui');

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((e) => FlightModel.fromJson(e)).toList();
      } else {
        throw ServiceExceptions('Failed to fetch flight data');
      }
    } on DioException catch (e) {
      throw ServiceExceptions(DioExceptionHandler.handle(e: e));
    } catch (e) {
      throw UnknownExceptions('Unexpected error');
    }
  }
}
