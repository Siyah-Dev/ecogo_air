import 'package:exogo/core/extensions/space_extensions.dart';
import 'package:exogo/core/theme/app_colors.dart';
import 'package:exogo/features/auth/presentation/providers/auth_controller_provider.dart';
import 'package:exogo/features/home/presentation/providers/home_controller_provider.dart';
import 'package:exogo/features/home/presentation/widgets/app_search_bar.dart';
import 'package:exogo/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:exogo/features/home/presentation/widgets/search_shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key, required this.isDestination});
  final bool isDestination;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    final authController = ref.read(authControllerProvider.notifier);
    final availableAirports = ref.watch(
      homeControllerProvider.select((state) => state.availableAirports),
    );
    final isLoading = ref.watch(
      homeControllerProvider.select((state) => state.isLoading),
    );

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(isAutoLeading: true),
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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            AppSearchBar(
              onChanged: (value) {
                controller.searchAirport(value);
              },
            ),
            16.h,
            if (isLoading)
              Expanded(child: SearchShimmerList())
            else
            availableAirports.isEmpty
                ?Center(child: Text('No Airports Found')) 
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final airport = availableAirports[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            tileColor: AppColors.white,
                            titleTextStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlue,
                            ),
                            title: Text("${airport.cityName} (${airport.airportCode})"),
                            subtitle: Text(airport.airportName ?? ''),
                            onTap: () {
                              controller.setSearchedAirport(isDestination, airport);
                              context.pop();
                            },
                          ),
                        );
                      },
                      itemCount: availableAirports.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
