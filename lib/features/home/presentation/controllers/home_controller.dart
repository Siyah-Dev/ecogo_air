import 'package:exogo/core/utils/app_snackbar.dart';
import 'package:exogo/features/home/data/model/flight_search_request_model.dart';
import 'package:exogo/features/home/data/model/post_params_model.dart';
import 'package:exogo/features/home/data/model/post_trip_model.dart';
import 'package:exogo/features/home/domain/entities/airport.dart';
import 'package:exogo/features/home/domain/use_case/home_use_case.dart';
import 'package:exogo/features/home/presentation/controllers/home_state.dart';
import 'package:exogo/features/home/presentation/model/flight_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this._homeUseCase) : super(HomeState.initial());
  final HomeUseCase _homeUseCase;

  void toggleDirectFlight(bool value) {
    state = state.copyWith(directFlight: value);
  }

  void toggleStudent(bool value) {
    state = state.copyWith(student: value);
  }

  void toggleSeniorCitizen(bool value) {
    state = state.copyWith(seniorCitizen: value);
  }

  void swapAirports() {
    final from = state.originAirport;
    final to = state.destinationAirport;
    state = state.copyWith(originAirport: to, destinationAirport: from);
  }

  void setSearchedAirport(bool? isDestination, Airport airport) {
    if (isDestination == true) {
      state = state.copyWith(destinationAirport: airport);
    } else {
      state = state.copyWith(originAirport: airport);
    }
  }

  void clearSearchedAirports() {
    state = state.copyWith(availableAirports: []);
  }

  Future<void> searchAirport(BuildContext context, String keyword) async {
    if (keyword.isEmpty) return;
    state = state.copyWith(isLoading: true);

    final result = await _homeUseCase.searchAirports(keyword);

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
        state = state.copyWith(isLoading: false);
        AppSnackBar.showError(context, state.error!);
      },
      (airports) {
        state = state.copyWith(availableAirports: airports);
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void setIsFlights(bool value) {
    state = state.copyWith(isFlights: value);
  }

  Future<void> searchFlights(BuildContext context, String uid) async {
    state = state.copyWith(isLoading: true, isFlights: true);
    final params = PostParamsModel(isDirect: state.directFlight);

    final trips = PostTripModel(
      from: state.originAirport?.iataCode ?? '',
      to: state.destinationAirport?.iataCode ?? '',
      onwardDate: state.departureDate.toIso8601String().split('T').first,
    );
    final request = FlightSearchRequestModel(
      adt: 1,
      chd: 1,
      inf: 0,
      cabin: '',
      trips: [trips],
      parameters: params,
    );

    final result = await _homeUseCase.searchFlights(request);

    result.fold(
      (failure) {
        state = state.copyWith(
          isFlights: false,
          error: failure.message,
          isLoading: false,
        );
        AppSnackBar.showError(context, state.error!);
      },
      (isSuccess) {
        getFlights(context, uid);
      },
    );
  }

  Future<void> getFlights(BuildContext context, String tui) async {
    state = state.copyWith(isLoading: true);

    final result = await _homeUseCase.getFlights(tui);

    result.fold(
      (failure) {
        state = state.copyWith(
          isFlights: false,
          error: failure.message,
          isLoading: false,
        );

        AppSnackBar.showError(context, state.error!);
      },
      (flights) {
        final List<FlightUiModel> uiFlights = [];

        for (final flight in flights) {
          for (final trip in flight.trips) {
            for (final segment in trip.segments) {
              uiFlights.add(
                FlightUiModel(
                  airline: segment.airline,
                  flightNumber: segment.flightNumber,
                  from: segment.from,
                  to: segment.to,
                  departureTime: segment.departureTime,
                  arrivalTime: segment.arrivalTime,
                  duration: segment.duration,
                  isNonStop: segment.stops == 0,
                  price: trip.totalFare,
                ),
              );
            }
          }
        }
        state = state.copyWith(flights: uiFlights, isLoading: false);
      },
    );
  }
}
