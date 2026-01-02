import 'package:dio/dio.dart';
import 'package:exogo/core/errors/dio_exception_handler.dart';
import 'package:exogo/core/errors/exceptions.dart';
import 'package:exogo/features/home/data/model/airport_model.dart';

class AirportRemoteDatasource {
  AirportRemoteDatasource(this._dio);

  final Dio _dio;

  Future<List<AirportModel>> searchAirports(String keyword) async{
   try {
     final response = await  _dio.get('airports/search', queryParameters: {
      'q': keyword,
    });

    if(response.statusCode == 200){
      final data = response.data as List;
      return data.map((e) => AirportModel.fromJson(e)).toList();
   }else{
      throw ServiceExceptions(
           'Failed to fetch airport data',
        );
   }
   } on DioException catch (e) {
      throw ServiceExceptions(
        DioExceptionHandler.handle(e: e),
      );
   }catch (e) {
     throw UnknownExceptions('Unexpected error');
   }
  }
}
