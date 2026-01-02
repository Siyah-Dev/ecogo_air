class AirportModel {
  String? airportName;
  String? airportCode;
  String? iataCode;
  String? icaoCode;
  String? cityName;
  String? cityIataCode;
  String? countryIso2;
  String? country;
  double? latitude;
  double? longitude;
  String? timezone;
  String? gmt;
  String? phoneNumber;
  bool? isActive;
  String? id;

  AirportModel({
    this.airportName,
    this.airportCode,
    this.iataCode,
    this.icaoCode,
    this.cityName,
    this.cityIataCode,
    this.countryIso2,
    this.country,
    this.latitude,
    this.longitude,
    this.timezone,
    this.gmt,
    this.phoneNumber,
    this.isActive,
    this.id,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) => AirportModel(
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
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
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
    "id": id,
  };
}
