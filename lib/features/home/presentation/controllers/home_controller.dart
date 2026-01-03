import 'package:exogo/features/home/domain/entities/airport.dart';
import 'package:exogo/features/home/domain/use_case/home_use_case.dart';
import 'package:exogo/features/home/presentation/controllers/home_state.dart';
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

  Future<void> searchAirport(String keyword) async {
    if (keyword.isEmpty) return;
    state = state.copyWith(isLoading: true);

    final result = await _homeUseCase(keyword);

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
         state = state.copyWith(isLoading: false);

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

  
}
