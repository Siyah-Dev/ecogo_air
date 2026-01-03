class Airport {
  final String? id;
  final String? airportName;
  final String? airportCode;
  final String? iataCode;
  final String? icaoCode;
  final String? cityName;
  final String? cityIataCode;
  final String? countryIso2;
  final String? country;
  final double? latitude;
  final double? longitude;
  final String? timezone;
  final String? gmt;
  final String? phoneNumber;
  final bool? isActive;

  const Airport({
    this.id,
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
  });
}
