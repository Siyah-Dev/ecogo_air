import 'package:exogo/features/home/presentation/providers/home_controller_provider.dart';
import 'package:exogo/features/home/presentation/widgets/flight_result_card.dart';
import 'package:exogo/features/home/presentation/widgets/search_shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlightResultPage extends ConsumerWidget {
  const FlightResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      homeControllerProvider.select((state) => state.isLoading),
    );
    final flights = ref.watch(
      homeControllerProvider.select((state) => state.flights),
    );
    return isLoading
        ? SearchShimmerList(height: 200, itemCount: 4) :flights.isEmpty? Center(
            child: Text('No Flights Found'),
          )
        : ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final flight = flights[index];
              return FlightResultCard(
                airlineName: flight.airline,
                flightNumber: flight.flightNumber,
                fromCode: flight.from,
                toCode: flight.to,
                departureTime: flight.departureTime,
                arrivalTime: flight.arrivalTime,
                departureDate: '3 JAN',
                arrivalDate: '4 JAN',
                duration: flight.duration.toString(),
                price: flight.price.toString(),
                isNonStop: flight.isNonStop,
              );
            },
          );
  }
}
