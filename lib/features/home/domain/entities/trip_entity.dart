import 'segment_entity.dart';

class TripEntity {
  final String provider;
  final double totalFare;
  final List<SegmentEntity> segments;

  TripEntity({
    required this.provider,
    required this.totalFare,
    required this.segments,
  });
}
