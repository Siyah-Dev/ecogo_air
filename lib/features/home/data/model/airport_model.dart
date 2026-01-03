import '../../domain/entities/airport.dart';

class AirportModel extends Airport {
  const AirportModel({
    super.id,
    super.airportName,
    super.airportCode,
    super.iataCode,
    super.icaoCode,
    super.cityName,
    super.cityIataCode,
    super.countryIso2,
    super.country,
    super.latitude,
    super.longitude,
    super.timezone,
    super.gmt,
    super.phoneNumber,
    super.isActive,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    return AirportModel(
      id: json["id"],
      airportName: json["airport_name"],
      airportCode: json["airport_code"],
      iataCode: json["iata_code"],
      icaoCode: json["icao_code"],
      cityName: json["city_name"],
      cityIataCode: json["city_iata_code"],
      countryIso2: json["country_iso2"],
      country: json["country"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      timezone: json["timezone"],
      gmt: json["gmt"],
      phoneNumber: json["phone_number"],
      isActive: json["is_active"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "airport_name": airportName,
      "airport_code": airportCode,
      "iata_code": iataCode,
      "icao_code": icaoCode,
      "city_name": cityName,
      "city_iata_code": cityIataCode,
      "country_iso2": countryIso2,
      "country": country,
      "latitude": latitude,
      "longitude": longitude,
      "timezone": timezone,
      "gmt": gmt,
      "phone_number": phoneNumber,
      "is_active": isActive,
    };
  }
}
