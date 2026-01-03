import 'package:exogo/core/extensions/space_extensions.dart';
import 'package:exogo/core/routes/app_route_names.dart';
import 'package:exogo/core/theme/app_colors.dart';
import 'package:exogo/features/auth/presentation/providers/auth_controller_provider.dart';
import 'package:exogo/features/home/presentation/providers/home_controller_provider.dart';
import 'package:exogo/features/home/presentation/widgets/airport_cart.dart';
import 'package:exogo/features/home/presentation/widgets/app_button.dart';
import 'package:exogo/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:exogo/features/home/presentation/widgets/flight_result_page.dart';
import 'package:exogo/features/home/presentation/widgets/preference_section.dart';
import 'package:exogo/features/home/presentation/widgets/trip_selection_wieget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final authController = ref.read(authControllerProvider.notifier);

    final controller = ref.read(homeControllerProvider.notifier);
    final to = ref.watch(homeControllerProvider.select((state) => state.destinationAirport));
    final from = ref.watch(homeControllerProvider.select((state) => state.originAirport));
    final isFlights = ref.watch(homeControllerProvider.select((state) => state.isFlights));

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        icon: isFlights ? Icons.close : null,
        onPressed: () {
          if (isFlights) {
            controller.setIsFlights(false);
          }
        },
      ),
      endDrawer: Drawer(
        child: Center(
          child: TextButton(
            onPressed: () {
              authController.signOut();
            },
            child: Text('Logout'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isFlights
            ? FlightResultPage()
            : Column(
                children: [
                  TripTypeSelector(isOneWay: state.isOneWay, onChanged: (value) {}),
                  16.h,
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Column(
                        spacing: 12,
                        children: [
                          AirportCard(
                            icon: Icons.flight_takeoff_outlined,
                            label: 'From',
                            title: from?.cityName == null
                                ? ''
                                : "${from?.cityName} (${from?.airportCode})",
                            subtitle: from?.airportName == null ? '' : "${from?.airportName!}",
                            onTap: () {
                              controller.clearSearchedAirports();
                              context.push(AppRouteNames.searchScreen, extra: false);
                            },
                          ),
                          AirportCard(
                            icon: Icons.flight_land_outlined,
                            label: 'To',
                            title: to?.cityName == null
                                ? ''
                                : "${to?.cityName} (${to?.airportCode})",
                            subtitle: to?.airportName == null ? '' : "${to?.airportName!}",
                            onTap: () {
                              controller.clearSearchedAirports();
                              context.push(AppRouteNames.searchScreen, extra: true);
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.swap_vert, size: 50),
                        onPressed: controller.swapAirports,
                      ),
                    ],
                  ),

                  16.h,

                  PreferencesSection(
                    direct: state.directFlight,
                    student: state.student,
                    senior: state.seniorCitizen,
                    onDirectChanged: controller.toggleDirectFlight,
                    onStudentChanged: controller.toggleStudent,
                    onSeniorChanged: controller.toggleSeniorCitizen,
                  ),

                  const Spacer(),

                  AppButton(
                    title: 'SEARCH',
                    onTap: () {
                      final uid = ref.read(authControllerProvider).userCred?.user?.uid ?? '';
                      controller.searchFlights(context, uid);
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
