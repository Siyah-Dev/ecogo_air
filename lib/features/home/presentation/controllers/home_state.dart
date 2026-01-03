import 'package:exogo/features/home/domain/entities/airport.dart';

class HomeState {
  final bool isLoading;
  final bool isOneWay;
  final bool isFlights;
  final Airport? destinationAirport;
  final Airport? originAirport;
  final List<Airport> availableAirports;
  final String? error;
  final String? message;

  final DateTime departureDate;
  final bool directFlight;
  final bool student;
  final bool seniorCitizen;

  const HomeState({
    required this.isOneWay,
    required this.isLoading,
    required this.isFlights,
    required this.destinationAirport,
    required this.originAirport,
    required this.availableAirports,
    required this.error,
    required this.message,

    required this.departureDate,
    required this.directFlight,
    required this.student,
    required this.seniorCitizen,
  });

  factory HomeState.initial() {
    return HomeState(
      isOneWay: true,
      isLoading: false,
      isFlights: false,
      destinationAirport: Airport(
        airportName: "Bangalore International Airport",
        airportCode: "BLR",
        iataCode: "BLR",
        icaoCode: "VOBL",
        cityName: "Bangalore",
        cityIataCode: "BLR",
        countryIso2: "IN",
        country: "India",
        latitude: 13.198889,
        longitude: 77.70556,
        timezone: "Asia/Kolkata",
        gmt: "5.30",
        phoneNumber: "080-6678-2425",
        isActive: true,
        id: "f084698f-5db9-41a9-9b32-9c93bdddee83",
      ),
      originAirport: Airport(
        airportName: "Indira Gandhi International Airport",
        airportCode: "DEL",
        iataCode: "DEL",
        icaoCode: "VIDP",
        cityName: "Delhi",
        cityIataCode: "DEL",
        countryIso2: "IN",
        country: "India",
        latitude: 28.556162,
        longitude: 77.100281,
        timezone: "Asia/Kolkata",
        gmt: "5.30",
        phoneNumber: "+91-11-25675757",
        isActive: true,
        id: "d290f1ee-6c54-4b01-90e6-d701748f0851",
      ),
      availableAirports: [],
      error: null,
      message: null,
      departureDate: DateTime.now(),
      directFlight: true,
      student: false,
      seniorCitizen: false,
    );
  }

  HomeState copyWith({
    bool? isOneWay,
    bool? isLoading,
    bool? isFlights,
    Airport? destinationAirport,
    Airport? originAirport,
    List<Airport>? availableAirports,
    String? error,
    String? message,
    DateTime? departureDate,
    bool? directFlight,
    bool? student,
    bool? seniorCitizen,
  }) {
    return HomeState(
      isOneWay: isOneWay ?? this.isOneWay,
      isLoading: isLoading ?? this.isLoading,
      isFlights: isFlights ?? this.isFlights,
      destinationAirport: destinationAirport ?? this.destinationAirport,
      originAirport: originAirport ?? this.originAirport,
      availableAirports: availableAirports ?? this.availableAirports,
      error: error ?? this.error,
      message: message ?? this.message,
      departureDate: departureDate ?? this.departureDate,
      directFlight: directFlight ?? this.directFlight,
      student: student ?? this.student,
      seniorCitizen: seniorCitizen ?? this.seniorCitizen,
    );
  }
}
