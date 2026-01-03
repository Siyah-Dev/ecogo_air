class FlightModel {
    String tui;
    bool isComplete;
    String provider;
    String providers;
    SearchResult searchResult;
    Status status;

    FlightModel({
        required this.tui,
        required this.isComplete,
        required this.provider,
        required this.providers,
        required this.searchResult,
        required this.status,
    });

    factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        tui: json["Tui"],
        isComplete: json["isComplete"],
        provider: json["provider"],
        providers: json["providers"],
        searchResult: SearchResult.fromJson(json["searchResult"]),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "Tui": tui,
        "isComplete": isComplete,
        "provider": provider,
        "providers": providers,
        "searchResult": searchResult.toJson(),
        "status": status.toJson(),
    };
}

class SearchResult {
    TripInfos tripInfos;

    SearchResult({
        required this.tripInfos,
    });

    factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        tripInfos: TripInfos.fromJson(json["tripInfos"]),
    );

    Map<String, dynamic> toJson() => {
        "tripInfos": tripInfos.toJson(),
    };
}

class TripInfos {
    List<Onward> onward;

    TripInfos({
        required this.onward,
    });

    factory TripInfos.fromJson(Map<String, dynamic> json) => TripInfos(
        onward: List<Onward>.from(json["ONWARD"].map((x) => Onward.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ONWARD": List<dynamic>.from(onward.map((x) => x.toJson())),
    };
}

class Onward {
    List<SegmentInformation> segmentInformation;
    AirFlowType airFlowType;
    String provider;
    List<TotalPriceList> totalPriceList;

    Onward({
        required this.segmentInformation,
        required this.airFlowType,
        required this.provider,
        required this.totalPriceList,
    });

    factory Onward.fromJson(Map<String, dynamic> json) => Onward(
        segmentInformation: List<SegmentInformation>.from(json["SegmentInformation"].map((x) => SegmentInformation.fromJson(x))),
        airFlowType: airFlowTypeValues.map[json["airFlowType"]]!,
        provider: json["provider"],
        totalPriceList: List<TotalPriceList>.from(json["totalPriceList"].map((x) => TotalPriceList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "SegmentInformation": List<dynamic>.from(segmentInformation.map((x) => x.toJson())),
        "airFlowType": airFlowTypeValues.reverse[airFlowType],
        "provider": provider,
        "totalPriceList": List<dynamic>.from(totalPriceList.map((x) => x.toJson())),
    };
}

enum AirFlowType {
    SEARCH
}

final airFlowTypeValues = EnumValues({
    "SEARCH": AirFlowType.SEARCH
});

class SegmentInformation {
    Airport arrivalAirport;
    String arrivalTime;
    Airport departureAirport;
    String departureTime;
    FlightDesignator flightDesignator;
    bool isArrivingNextDay;
    Oac oac;
    int segmentNumber;
    List<dynamic>? stopOverairports;
    int duration;
    String id;
    bool isReturnSegment;
    int stops;

    SegmentInformation({
        required this.arrivalAirport,
        required this.arrivalTime,
        required this.departureAirport,
        required this.departureTime,
        required this.flightDesignator,
        required this.isArrivingNextDay,
        required this.oac,
        required this.segmentNumber,
        required this.stopOverairports,
        required this.duration,
        required this.id,
        required this.isReturnSegment,
        required this.stops,
    });

    factory SegmentInformation.fromJson(Map<String, dynamic> json) => SegmentInformation(
        arrivalAirport: Airport.fromJson(json["ArrivalAirport"]),
        arrivalTime: json["ArrivalTime"],
        departureAirport: Airport.fromJson(json["DepartureAirport"]),
        departureTime: json["DepartureTime"],
        flightDesignator: FlightDesignator.fromJson(json["FlightDesignator"]),
        isArrivingNextDay: json["IsArrivingNextDay"],
        oac: Oac.fromJson(json["OAC"]),
        segmentNumber: json["SegmentNumber"],
        stopOverairports: json["StopOverairports"] == null ? [] : List<dynamic>.from(json["StopOverairports"]!.map((x) => x)),
        duration: json["duration"],
        id: json["id"],
        isReturnSegment: json["isReturnSegment"],
        stops: json["stops"],
    );

    Map<String, dynamic> toJson() => {
        "ArrivalAirport": arrivalAirport.toJson(),
        "ArrivalTime": arrivalTime,
        "DepartureAirport": departureAirport.toJson(),
        "DepartureTime": departureTime,
        "FlightDesignator": flightDesignator.toJson(),
        "IsArrivingNextDay": isArrivingNextDay,
        "OAC": oac.toJson(),
        "SegmentNumber": segmentNumber,
        "StopOverairports": stopOverairports == null ? [] : List<dynamic>.from(stopOverairports!.map((x) => x)),
        "duration": duration,
        "id": id,
        "isReturnSegment": isReturnSegment,
        "stops": stops,
    };
}

class Airport {
    City city;
    CityCodeEnum cityCode;
    CityCodeEnum code;
    Country country;
    CountryCode countryCode;
    ArrivalAirportName name;
    Terminal terminal;

    Airport({
        required this.city,
        required this.cityCode,
        required this.code,
        required this.country,
        required this.countryCode,
        required this.name,
        required this.terminal,
    });

    factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        city: cityValues.map[json["city"]]!,
        cityCode: cityCodeEnumValues.map[json["cityCode"]]!,
        code: cityCodeEnumValues.map[json["code"]]!,
        country: countryValues.map[json["country"]]!,
        countryCode: countryCodeValues.map[json["countryCode"]]!,
        name: arrivalAirportNameValues.map[json["name"]]!,
        terminal: terminalValues.map[json["terminal"]]!,
    );

    Map<String, dynamic> toJson() => {
        "city": cityValues.reverse[city],
        "cityCode": cityCodeEnumValues.reverse[cityCode],
        "code": cityCodeEnumValues.reverse[code],
        "country": countryValues.reverse[country],
        "countryCode": countryCodeValues.reverse[countryCode],
        "name": arrivalAirportNameValues.reverse[name],
        "terminal": terminalValues.reverse[terminal],
    };
}

enum City {
    CAMPBELLTOWN,
    DUBAI,
    FRANKFURT,
    GLASGOW,
    LONDON,
    MUMBAI
}

final cityValues = EnumValues({
    "Campbelltown": City.CAMPBELLTOWN,
    "Dubai": City.DUBAI,
    "Frankfurt": City.FRANKFURT,
    "Glasgow": City.GLASGOW,
    "London": City.LONDON,
    "Mumbai": City.MUMBAI
});

enum CityCodeEnum {
    BOM,
    CAL,
    DXB,
    FRA,
    GLA,
    LCY,
    LHR,
    LON
}

final cityCodeEnumValues = EnumValues({
    "BOM": CityCodeEnum.BOM,
    "CAL": CityCodeEnum.CAL,
    "DXB": CityCodeEnum.DXB,
    "FRA": CityCodeEnum.FRA,
    "GLA": CityCodeEnum.GLA,
    "LCY": CityCodeEnum.LCY,
    "LHR": CityCodeEnum.LHR,
    "LON": CityCodeEnum.LON
});

enum Country {
    GERMANY,
    INDIA,
    UNITED_ARAB_EMIRATES,
    UNITED_KINGDOM
}

final countryValues = EnumValues({
    "Germany": Country.GERMANY,
    "India": Country.INDIA,
    "United Arab Emirates": Country.UNITED_ARAB_EMIRATES,
    "United Kingdom": Country.UNITED_KINGDOM
});

enum CountryCode {
    AE,
    DE,
    GB,
    IN
}

final countryCodeValues = EnumValues({
    "AE": CountryCode.AE,
    "DE": CountryCode.DE,
    "GB": CountryCode.GB,
    "IN": CountryCode.IN
});

enum ArrivalAirportName {
    CHHATRAPATI_SHIVAJI,
    DUBAI_INTL_ARPT,
    FRANKFURT_INTL,
    GLASGOW_INTL,
    HEATHROW,
    LONDON_CITY_ARPT,
    MACHRIHANISH_ARPT
}

final arrivalAirportNameValues = EnumValues({
    "Chhatrapati Shivaji": ArrivalAirportName.CHHATRAPATI_SHIVAJI,
    "Dubai Intl Arpt": ArrivalAirportName.DUBAI_INTL_ARPT,
    "Frankfurt Intl": ArrivalAirportName.FRANKFURT_INTL,
    "Glasgow Intl": ArrivalAirportName.GLASGOW_INTL,
    "Heathrow": ArrivalAirportName.HEATHROW,
    "London City Arpt": ArrivalAirportName.LONDON_CITY_ARPT,
    "Machrihanish Arpt": ArrivalAirportName.MACHRIHANISH_ARPT
});

enum Terminal {
    EMPTY,
    TERMINAL_1,
    TERMINAL_2,
    TERMINAL_3,
    TERMINAL_5,
    TERMINAL_M
}

final terminalValues = EnumValues({
    "": Terminal.EMPTY,
    "Terminal 1": Terminal.TERMINAL_1,
    "Terminal 2": Terminal.TERMINAL_2,
    "Terminal 3": Terminal.TERMINAL_3,
    "Terminal 5": Terminal.TERMINAL_5,
    "Terminal M": Terminal.TERMINAL_M
});

class FlightDesignator {
    String equipmentType;
    String flightNumber;
    Oac mac;

    FlightDesignator({
        required this.equipmentType,
        required this.flightNumber,
        required this.mac,
    });

    factory FlightDesignator.fromJson(Map<String, dynamic> json) => FlightDesignator(
        equipmentType: json["EquipmentType"],
        flightNumber: json["FlightNumber"],
        mac: Oac.fromJson(json["MAC"]),
    );

    Map<String, dynamic> toJson() => {
        "EquipmentType": equipmentType,
        "FlightNumber": flightNumber,
        "MAC": mac.toJson(),
    };
}

class Oac {
    OacCode code;
    bool isLcc;
    OacName name;

    Oac({
        required this.code,
        required this.isLcc,
        required this.name,
    });

    factory Oac.fromJson(Map<String, dynamic> json) => Oac(
        code: oacCodeValues.map[json["code"]]!,
        isLcc: json["isLcc"],
        name: oacNameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "code": oacCodeValues.reverse[code],
        "isLcc": isLcc,
        "name": oacNameValues.reverse[name],
    };
}

enum OacCode {
    AI,
    BA,
    CJ,
    EK,
    EMPTY,
    LH,
    LM
}

final oacCodeValues = EnumValues({
    "AI": OacCode.AI,
    "BA": OacCode.BA,
    "CJ": OacCode.CJ,
    "EK": OacCode.EK,
    "": OacCode.EMPTY,
    "LH": OacCode.LH,
    "LM": OacCode.LM
});

enum OacName {
    AIR_INDIA,
    BA_CITY_FLYER,
    BRITISH_AIRWAYS,
    EMIRATES_AIRLINES,
    EMPTY,
    LIVINGSTON,
    LUFTHANSA
}

final oacNameValues = EnumValues({
    "Air India": OacName.AIR_INDIA,
    "BA City Flyer": OacName.BA_CITY_FLYER,
    "British Airways": OacName.BRITISH_AIRWAYS,
    "Emirates Airlines": OacName.EMIRATES_AIRLINES,
    "": OacName.EMPTY,
    "Livingston": OacName.LIVINGSTON,
    "Lufthansa": OacName.LUFTHANSA
});

class TotalPriceList {
    FareDetail fareDetail;
    List<dynamic> matchedSpecialReturnIdentifier;
    String priceId;
    String specialReturnIdentifier;
    TripAdditionalInformation tripAdditionalInformation;
    FareIdentifier fareIdentifier;
    bool icca;
    List<dynamic> messages;

    TotalPriceList({
        required this.fareDetail,
        required this.matchedSpecialReturnIdentifier,
        required this.priceId,
        required this.specialReturnIdentifier,
        required this.tripAdditionalInformation,
        required this.fareIdentifier,
        required this.icca,
        required this.messages,
    });

    factory TotalPriceList.fromJson(Map<String, dynamic> json) => TotalPriceList(
        fareDetail: FareDetail.fromJson(json["FareDetail"]),
        matchedSpecialReturnIdentifier: List<dynamic>.from(json["MatchedSpecialReturnIdentifier"].map((x) => x)),
        priceId: json["PriceId"],
        specialReturnIdentifier: json["SpecialReturnIdentifier"],
        tripAdditionalInformation: TripAdditionalInformation.fromJson(json["TripAdditionalInformation"]),
        fareIdentifier: fareIdentifierValues.map[json["fareIdentifier"]]!,
        icca: json["icca"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "FareDetail": fareDetail.toJson(),
        "MatchedSpecialReturnIdentifier": List<dynamic>.from(matchedSpecialReturnIdentifier.map((x) => x)),
        "PriceId": priceId,
        "SpecialReturnIdentifier": specialReturnIdentifier,
        "TripAdditionalInformation": tripAdditionalInformation.toJson(),
        "fareIdentifier": fareIdentifierValues.reverse[fareIdentifier],
        "icca": icca,
        "messages": List<dynamic>.from(messages.map((x) => x)),
    };
}

class FareDetail {
    FareDetailAdult adult;

    FareDetail({
        required this.adult,
    });

    factory FareDetail.fromJson(Map<String, dynamic> json) => FareDetail(
        adult: FareDetailAdult.fromJson(json["ADULT"]),
    );

    Map<String, dynamic> toJson() => {
        "ADULT": adult.toJson(),
    };
}

class FareDetailAdult {
    AdditionalFareComponents additionalFareComponents;
    BaggageInformation baggageInformation;
    CabinClass cabinClass;
    ClassOfBooking classOfBooking;
    FareBasis fareBasis;
    bool mealIndicator;
    int refundableType;
    int seatsRemaining;
    FareComponents fareComponents;

    FareDetailAdult({
        required this.additionalFareComponents,
        required this.baggageInformation,
        required this.cabinClass,
        required this.classOfBooking,
        required this.fareBasis,
        required this.mealIndicator,
        required this.refundableType,
        required this.seatsRemaining,
        required this.fareComponents,
    });

    factory FareDetailAdult.fromJson(Map<String, dynamic> json) => FareDetailAdult(
        additionalFareComponents: AdditionalFareComponents.fromJson(json["AdditionalFareComponents"]),
        baggageInformation: BaggageInformation.fromJson(json["BaggageInformation"]),
        cabinClass: cabinClassValues.map[json["CabinClass"]]!,
        classOfBooking: classOfBookingValues.map[json["ClassOfBooking"]]!,
        fareBasis: fareBasisValues.map[json["FareBasis"]]!,
        mealIndicator: json["MealIndicator "],
        refundableType: json["RefundableType"],
        seatsRemaining: json["SeatsRemaining"],
        fareComponents: FareComponents.fromJson(json["fareComponents"]),
    );

    Map<String, dynamic> toJson() => {
        "AdditionalFareComponents": additionalFareComponents.toJson(),
        "BaggageInformation": baggageInformation.toJson(),
        "CabinClass": cabinClassValues.reverse[cabinClass],
        "ClassOfBooking": classOfBookingValues.reverse[classOfBooking],
        "FareBasis": fareBasisValues.reverse[fareBasis],
        "MealIndicator ": mealIndicator,
        "RefundableType": refundableType,
        "SeatsRemaining": seatsRemaining,
        "fareComponents": fareComponents.toJson(),
    };
}

class AdditionalFareComponents {
    TaxesAndFees taxesAndFees;

    AdditionalFareComponents({
        required this.taxesAndFees,
    });

    factory AdditionalFareComponents.fromJson(Map<String, dynamic> json) => AdditionalFareComponents(
        taxesAndFees: TaxesAndFees.fromJson(json["TaxesAndFees"]),
    );

    Map<String, dynamic> toJson() => {
        "TaxesAndFees": taxesAndFees.toJson(),
    };
}

class TaxesAndFees {
    int airlineGstComponent;
    int carrierMiscFee;
    int fuelSurcharge;
    int managementFee;
    double managementFeeTax;
    int otherCharges;

    TaxesAndFees({
        required this.airlineGstComponent,
        required this.carrierMiscFee,
        required this.fuelSurcharge,
        required this.managementFee,
        required this.managementFeeTax,
        required this.otherCharges,
    });

    factory TaxesAndFees.fromJson(Map<String, dynamic> json) => TaxesAndFees(
        airlineGstComponent: json["AirlineGSTComponent"],
        carrierMiscFee: json["CarrierMiscFee"],
        fuelSurcharge: json["FuelSurcharge"],
        managementFee: json["ManagementFee"],
        managementFeeTax: json["ManagementFeeTax"]?.toDouble(),
        otherCharges: json["OtherCharges"],
    );

    Map<String, dynamic> toJson() => {
        "AirlineGSTComponent": airlineGstComponent,
        "CarrierMiscFee": carrierMiscFee,
        "FuelSurcharge": fuelSurcharge,
        "ManagementFee": managementFee,
        "ManagementFeeTax": managementFeeTax,
        "OtherCharges": otherCharges,
    };
}

class BaggageInformation {
    CabinBaggage cabinBaggage;
    CheckingBaggage checkingBaggage;

    BaggageInformation({
        required this.cabinBaggage,
        required this.checkingBaggage,
    });

    factory BaggageInformation.fromJson(Map<String, dynamic> json) => BaggageInformation(
        cabinBaggage: cabinBaggageValues.map[json["CabinBaggage"]]!,
        checkingBaggage: checkingBaggageValues.map[json["CheckingBaggage"]]!,
    );

    Map<String, dynamic> toJson() => {
        "CabinBaggage": cabinBaggageValues.reverse[cabinBaggage],
        "CheckingBaggage": checkingBaggageValues.reverse[checkingBaggage],
    };
}

enum CabinBaggage {
    THE_7_KG
}

final cabinBaggageValues = EnumValues({
    "7 Kg": CabinBaggage.THE_7_KG
});

enum CheckingBaggage {
    CHECKING_BAGGAGE_2_PIECE,
    THE_1_PIECE,
    THE_2_PIECE,
    THE_2_UNIT_S,
    THE_30_KILOGRAMS,
    THE_50_KG
}

final checkingBaggageValues = EnumValues({
    "2  Piece": CheckingBaggage.CHECKING_BAGGAGE_2_PIECE,
    "1  Piece": CheckingBaggage.THE_1_PIECE,
    "2 Piece": CheckingBaggage.THE_2_PIECE,
    "2 Unit(s)": CheckingBaggage.THE_2_UNIT_S,
    "30 Kilograms": CheckingBaggage.THE_30_KILOGRAMS,
    "50 Kg": CheckingBaggage.THE_50_KG
});

enum CabinClass {
    ECONOMY
}

final cabinClassValues = EnumValues({
    "ECONOMY": CabinClass.ECONOMY
});

enum ClassOfBooking {
    H,
    L,
    T,
    V,
    W
}

final classOfBookingValues = EnumValues({
    "H": ClassOfBooking.H,
    "L": ClassOfBooking.L,
    "T": ClassOfBooking.T,
    "V": ClassOfBooking.V,
    "W": ClassOfBooking.W
});

enum FareBasis {
    TLNF00_S7,
    VGLM1,
    WGLM1,
    YNNF00_S1
}

final fareBasisValues = EnumValues({
    "TLNF00S7": FareBasis.TLNF00_S7,
    "VGLM1": FareBasis.VGLM1,
    "WGLM1": FareBasis.WGLM1,
    "YNNF00S1": FareBasis.YNNF00_S1
});

class FareComponents {
    int baseFare;
    double netFare;
    double taxesAndFees;
    double totalFare;

    FareComponents({
        required this.baseFare,
        required this.netFare,
        required this.taxesAndFees,
        required this.totalFare,
    });

    factory FareComponents.fromJson(Map<String, dynamic> json) => FareComponents(
        baseFare: json["BaseFare"],
        netFare: json["NetFare"]?.toDouble(),
        taxesAndFees: json["TaxesAndFees"]?.toDouble(),
        totalFare: json["TotalFare"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "BaseFare": baseFare,
        "NetFare": netFare,
        "TaxesAndFees": taxesAndFees,
        "TotalFare": totalFare,
    };
}

enum FareIdentifier {
    ECONOMY_FULLY_FLEX,
    PUBLISHED
}

final fareIdentifierValues = EnumValues({
    "ECONOMY FULLY FLEX": FareIdentifier.ECONOMY_FULLY_FLEX,
    "PUBLISHED": FareIdentifier.PUBLISHED
});

class TripAdditionalInformation {
    Map<String, List<TripBaggageInformation>> tripBaggageInformation;

    TripAdditionalInformation({
        required this.tripBaggageInformation,
    });

    factory TripAdditionalInformation.fromJson(Map<String, dynamic> json) => TripAdditionalInformation(
        tripBaggageInformation: Map.from(json["TripBaggageInformation"]).map((k, v) => MapEntry<String, List<TripBaggageInformation>>(k, List<TripBaggageInformation>.from(v.map((x) => TripBaggageInformation.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "TripBaggageInformation": Map.from(tripBaggageInformation).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    };
}

class TripBaggageInformation {
    TripBaggageInformationAdult adult;

    TripBaggageInformation({
        required this.adult,
    });

    factory TripBaggageInformation.fromJson(Map<String, dynamic> json) => TripBaggageInformation(
        adult: TripBaggageInformationAdult.fromJson(json["ADULT"]),
    );

    Map<String, dynamic> toJson() => {
        "ADULT": adult.toJson(),
    };
}

class TripBaggageInformationAdult {
    CabinBaggage cB;
    CheckingBaggage iB;

    TripBaggageInformationAdult({
        required this.cB,
        required this.iB,
    });

    factory TripBaggageInformationAdult.fromJson(Map<String, dynamic> json) => TripBaggageInformationAdult(
        cB: cabinBaggageValues.map[json["cB"]]!,
        iB: checkingBaggageValues.map[json["iB"]]!,
    );

    Map<String, dynamic> toJson() => {
        "cB": cabinBaggageValues.reverse[cB],
        "iB": checkingBaggageValues.reverse[iB],
    };
}

class Status {
    int httpStatus;
    bool success;

    Status({
        required this.httpStatus,
        required this.success,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        httpStatus: json["httpStatus"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "success": success,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
