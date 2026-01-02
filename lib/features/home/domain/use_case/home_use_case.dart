import 'package:exogo/core/errors/failures.dart';
import 'package:exogo/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../entities/airport.dart';


class HomeUseCase {
  final HomeRepository repository;

  HomeUseCase(this.repository);

  Future<Either<Failure, List<Airport>>> call(String keyword) {
    return repository.searchAirports(keyword);
  }
}
