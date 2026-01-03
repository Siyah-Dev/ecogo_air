import 'package:exogo/features/home/presentation/widgets/flight_result_card.dart';
import 'package:flutter/material.dart';

class FlightResultPage extends StatelessWidget {
  const FlightResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 10, itemBuilder: (context, index) {
      return FlightResultCard(airlineName: 'airlineName', flightNumber: 'flightNumber', fromCode: 'fromCode', toCode: 'toCode', departureTime: '06:30', arrivalTime: '08:45', departureDate: '3 JAN', arrivalDate: '4 JAN', duration: '12 h 30 m', price: '4444', isNonStop: true, airlineLogoAsset: 'airlineLogoAsset');
    },);
  }
}