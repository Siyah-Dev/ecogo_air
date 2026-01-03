import 'package:exogo/features/home/data/model/flight_model.dart';
import 'package:exogo/features/home/domain/entities/flight_entity.dart';
import 'package:exogo/features/home/domain/entities/segment_entity.dart';
import 'package:exogo/features/home/domain/entities/trip_entity.dart';

extension FlightMapper on FlightModel {
  FlightEntity toEntity() {
    return FlightEntity(
      tui: tui,
      isComplete: isComplete,
      trips: searchResult.tripInfos.onward.map((onward) {
        final price = onward.totalPriceList.first;

        return TripEntity(
          provider: onward.provider,
          totalFare: price.fareDetail.adult.fareComponents.totalFare,
          segments: onward.segmentInformation.map((segment) {
            return SegmentEntity(
              airline: segment.oac.name.name,
              flightNumber: segment.flightDesignator.flightNumber,
              from: segment.departureAirport.code.name,
              to: segment.arrivalAirport.code.name,
              departureTime: segment.departureTime,
              arrivalTime: segment.arrivalTime,
              duration: segment.duration,
              stops: segment.stops,
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
