import 'package:exogo/features/home/data/model/post_params_model.dart';
import 'package:exogo/features/home/data/model/post_trip_model.dart';

class FlightSearchRequestModel {
  final int adt;
  final int chd;
  final int inf;
  final String cabin;
  final String source;
  final String mode;
  final String clientId;
  final String fareType;
  final String secType;
  final List<PostTripModel> trips;
  final PostParamsModel parameters;

  const FlightSearchRequestModel({
    required this.adt,
    required this.chd,
    required this.inf,
    required this.cabin,
    this.source = "",
    this.mode = "",
    this.clientId = "",
    this.fareType = "",
    this.secType = "",
    required this.trips,
    required this.parameters,
  });

  Map<String, dynamic> toJson() {
    return {
      "ADT": adt,
      "CHD": chd,
      "INF": inf,
      "Cabin": cabin,
      "Source": source,
      "Mode": mode,
      "ClientID": clientId,
      "FareType": fareType,
      "SecType": secType,
      "Trips": trips.map((e) => e.toJson()).toList(),
      "Parameters": parameters.toJson(),
    };
  }
}
