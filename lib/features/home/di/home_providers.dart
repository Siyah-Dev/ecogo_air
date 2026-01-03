import 'package:dio/dio.dart';
import 'package:exogo/core/network/dio_provider.dart';
import 'package:exogo/features/home/data/datasources/remote/airport_remote_datasource.dart';
import 'package:exogo/features/home/data/datasources/remote/flight_remote_datasource.dart';
import 'package:exogo/features/home/data/repository/home_repo_impl.dart';
import 'package:exogo/features/home/domain/repository/home_repository.dart';
import 'package:exogo/features/home/domain/use_case/home_use_case.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final airportDioProvider = Provider<Dio>((ref) {
  return createDio(baseUrl: dotenv.env['AIRPORT_BASE_URL']!);
});

final flightDioProvider = Provider<Dio>((ref) {
  return createDio(baseUrl: dotenv.env['FLIGHT_BASE_URL']!);
});

final airportRemoteDataSourceProvider = Provider<AirportRemoteDatasource>(
  (ref) => AirportRemoteDatasource(ref.read(airportDioProvider)),
);

final flightRemoteDataSourceProvider = Provider<FlightRemoteDatasource>(
  (ref) => FlightRemoteDatasource(ref.read(flightDioProvider)),
);

final homeRespositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepoImpl(
    ref.read(airportRemoteDataSourceProvider),
    ref.read(flightRemoteDataSourceProvider),
  ),
);

final homeUseCaseProvider = Provider<HomeUseCase>(
  (ref) => HomeUseCase(ref.read(homeRespositoryProvider)),
);
