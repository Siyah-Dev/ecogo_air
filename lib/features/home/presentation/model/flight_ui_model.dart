class FlightUiModel {
  final String airline;
  final String flightNumber;
  final String from;
  final String to;
  final String departureTime;
  final String arrivalTime;
  final int duration;
  final bool isNonStop;
  final double price;

  FlightUiModel({
    required this.airline,
    required this.flightNumber,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.isNonStop,
    required this.price,
  });
}
