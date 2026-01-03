class SegmentEntity {
  final String airline;
  final String flightNumber;
  final String from;
  final String to;
  final String departureTime;
  final String arrivalTime;
  final int duration;
  final int stops;

  SegmentEntity({
    required this.airline,
    required this.flightNumber,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.stops,
  });
}
