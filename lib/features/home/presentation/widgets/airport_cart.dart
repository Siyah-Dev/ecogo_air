import 'package:exogo/core/extensions/space_extensions.dart';
import 'package:exogo/core/theme/app_colors.dart';
import 'package:exogo/core/utils/bottom_sheet_helper.dart';
import 'package:exogo/features/home/data/model/airport_model.dart';
import 'package:exogo/features/home/presentation/providers/home_controller_provider.dart';
import 'package:exogo/features/home/presentation/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AirportCard extends ConsumerWidget {
  final IconData? icon;
  final String? label;
  final String title;
  final String subtitle;
  final bool isOrigin;

  const AirportCard({
    super.key,
    this.icon,
    this.label,
    required this.title,
    required this.subtitle,
    this.isOrigin = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableAirports = ref.watch(
      homeControllerProvider.select((state) => state.availableAirports),
    );
    final controller = ref.read(homeControllerProvider.notifier);

    return InkWell(
      onTap: () {
        showAppBottomSheet(
          context: context,
          child: ListView.builder(
            itemBuilder: (context, index) {
              final airport = availableAirports[index];
              return ListTile(
                title: Text("${airport.cityName} (${airport.airportCode})"),
                subtitle: Text(airport.airportName ?? ''),
                onTap: () {
                  controller.setSearchedAirport(isOrigin, airport);
                  Navigator.of(context).pop();
                },
              );
            },
            itemCount: availableAirports.length,
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: AppCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(icon, size: 40, color: AppColors.grey),
                ),

              12.w,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (label != null)
                      Text(
                        label!.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey,
                          letterSpacing: 0.8,
                        ),
                      ),

                    4.h,

                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),

                    2.h,

                    Text(subtitle, style: TextStyle(fontSize: 13, color: AppColors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
