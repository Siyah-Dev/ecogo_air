import 'package:exogo/core/errors/exceptions.dart';
import 'package:exogo/core/errors/failures.dart';
import 'package:exogo/features/home/data/datasources/remote/airport_remote_datasource.dart';
import 'package:exogo/features/home/data/datasources/remote/flight_remote_datasource.dart';
import 'package:exogo/features/home/data/mappers/flight_mapper.dart';
import 'package:exogo/features/home/data/model/flight_search_request_model.dart';
import 'package:exogo/features/home/domain/entities/flight_entity.dart';
import 'package:exogo/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/airport.dart';

class HomeRepoImpl implements HomeRepository {
  final AirportRemoteDatasource airportDataSource;
  final FlightRemoteDatasource flightDataSource;

  HomeRepoImpl(this.airportDataSource, this.flightDataSource);

  @override
  Future<Either<Failure, List<Airport>>> searchAirports(String keyword) async {
    try {
      final airports = await airportDataSource.searchAirports(keyword);
      return Right(airports);
    } on ServiceExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on UnknownExceptions catch (e) {
      return Left(UnknownFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> searchFlights(
    FlightSearchRequestModel request,
  ) async {
    try {
      final isSuccess = await flightDataSource.searchFlights(request);
      return Right(isSuccess);
    } on ServiceExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on UnknownExceptions catch (e) {
      return Left(UnknownFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<FlightEntity>>> getFlights(String tui) async {
    try {
      final flights = await flightDataSource.getFlights(tui);
      return Right(flights.map((e) => e.toEntity()).toList());
    } on ServiceExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on UnknownExceptions catch (e) {
      return Left(UnknownFailure(e.message));
    }
  }
}
