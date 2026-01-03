import 'package:exogo/core/errors/failures.dart';
import 'package:exogo/features/home/data/model/flight_search_request_model.dart';
import 'package:exogo/features/home/domain/entities/airport.dart';
import 'package:exogo/features/home/domain/entities/flight_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Airport>>> searchAirports(String keyword);
  Future<Either<Failure, bool>> searchFlights(FlightSearchRequestModel request);
  Future<Either<Failure, List<FlightEntity>>> getFlights(String tui);
}
