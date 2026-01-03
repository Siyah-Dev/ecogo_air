import 'package:exogo/core/extensions/space_extensions.dart';
import 'package:flutter/material.dart';

class FlightResultCard extends StatelessWidget {
  final String airlineName;
  final String flightNumber;
  final String fromCode;
  final String toCode;
  final String departureTime;
  final String arrivalTime;
  final String departureDate;
  final String arrivalDate;
  final String duration;
  final String price;
  final bool isNonStop;
  final String? airlineLogoAsset;

  const FlightResultCard({
    super.key,
    required this.airlineName,
    required this.flightNumber,
    required this.fromCode,
    required this.toCode,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureDate,
    required this.arrivalDate,
    required this.duration,
    required this.price,
    required this.isNonStop,
    this.airlineLogoAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (airlineLogoAsset != null)
                      Image.asset(airlineLogoAsset!, height: 32, width: 32),
                    8.w,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          airlineName,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          flightNumber,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.shopping_bag_outlined, color: Colors.green),
                    SizedBox(width: 8),
                    Icon(Icons.luggage_outlined, color: Colors.green),
                  ],
                ),
              ],
            ),

            16.h,

            /// Time Row
            Row(
              children: [
                _TimeColumn(
                  time: departureTime,
                  date: departureDate,
                  code: fromCode,
                  alignStart: true,
                ),

                Expanded(
                  child: Column(
                    children: [
                      Text(
                        duration,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      6.h,
                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          SizedBox(width: 6),
                          Icon(Icons.circle, size: 6),
                          SizedBox(width: 6),
                          Expanded(child: Divider()),
                        ],
                      ),
                      6.h,
                      Text(
                        isNonStop ? 'Non-stop' : 'Stops',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                _TimeColumn(
                  time: arrivalTime,
                  date: arrivalDate,
                  code: toCode,
                  alignStart: false,
                ),
              ],
            ),

            16.h,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Flight Details'),
                ),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    12.w,
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeColumn extends StatelessWidget {
  final String time;
  final String date;
  final String code;
  final bool alignStart;

  const _TimeColumn({
    required this.time,
    required this.date,
    required this.code,
    required this.alignStart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignStart
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Text(
          time,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        2.h,
        Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        2.h,
        Text(code, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
