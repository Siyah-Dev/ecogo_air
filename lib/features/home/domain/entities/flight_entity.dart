import 'trip_entity.dart';

class FlightEntity {
  final String tui;
  final bool isComplete;
  final List<TripEntity> trips;

  FlightEntity({
    required this.tui,
    required this.isComplete,
    required this.trips,
  });
}
