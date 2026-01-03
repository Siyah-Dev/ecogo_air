import 'package:exogo/core/errors/failures.dart';
import 'package:exogo/features/home/data/model/flight_search_request_model.dart';
import 'package:exogo/features/home/domain/entities/flight_entity.dart';
import 'package:exogo/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../entities/airport.dart';


class HomeUseCase {
  final HomeRepository repository;

  HomeUseCase(this.repository);

  Future<Either<Failure, List<Airport>>> searchAirports(String keyword) {
    return repository.searchAirports(keyword);
  }

  Future<Either<Failure, bool>> searchFlights(FlightSearchRequestModel request) {
    return repository.searchFlights(request);
  }
  Future<Either<Failure, List<FlightEntity>>> getFlights(String tui) {
    return repository.getFlights(tui);
  }
}
