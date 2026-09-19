import 'package:flutter/material.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/explore_map/trips_carousel/trip_card.dart';

class DesktopTripsCarousel extends StatelessWidget {
  const DesktopTripsCarousel({super.key, required this.tripIds});

  final List<TripId> tripIds;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      top: 16,
      bottom: 16,
      child: SafeArea(
        child: SizedBox(
          width: 320,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.surface,
            clipBehavior: Clip.antiAlias,
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: tripIds.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return TripCard(tripId: tripIds[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
