import 'package:exogo/core/errors/failures.dart';
import 'package:exogo/features/home/domain/entities/airport.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Airport>>> searchAirports(String keyword);
}