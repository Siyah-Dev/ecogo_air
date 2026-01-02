import 'package:exogo/features/home/data/model/airport_model.dart';
import 'package:exogo/features/home/presentation/controllers/home_state.dart';
import 'package:flutter_riverpod/legacy.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initial());

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
    state = state.copyWith(originAirport:to, destinationAirport: from);
  }

  void setSearchedAirport(bool? isOrigin, AirportModel airport) {
    if (isOrigin == true) {
      state = state.copyWith(originAirport: airport);
    } else {
      state = state.copyWith(destinationAirport: airport);
    }
  }
}
