import 'package:exogo/core/errors/exceptions.dart';
import 'package:exogo/core/errors/failures.dart';
import 'package:exogo/features/home/data/datasources/remote/airport_remote_datasource.dart';
import 'package:exogo/features/home/data/datasources/remote/flight_remote_datasource.dart';
import 'package:exogo/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/airport.dart';


class HomeRepoImpl implements HomeRepository {
  final AirportRemoteDatasource airportDataSource;
  final FlightRemoteDatasource flightDataSource;

  HomeRepoImpl(this.airportDataSource, this.flightDataSource);

  @override
  Future<Either<Failure, List<Airport>>> searchAirports(
    String keyword,
  ) async {
    try {
      final airports = await airportDataSource.searchAirports(keyword);
      return Right(airports);
    } on ServiceExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on UnknownExceptions catch (e) {
      return Left(UnknownFailure(e.message));
    }
  }
}
