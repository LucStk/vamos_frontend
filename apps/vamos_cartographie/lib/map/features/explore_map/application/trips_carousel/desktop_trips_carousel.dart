import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/trip.dart';

import 'package:vamos_cartographie/map/map.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'trip_card.dart';
import 'package:trip_application/trip_application.dart';

@Dependencies([mapExploreController])
class DesktopTripsCarousel extends ConsumerWidget {
  const DesktopTripsCarousel({super.key, required this.tripIds});

  final List<TripId> tripIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(mapExploreControllerProvider);
    return SafeArea(
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
              final tripId = tripIds[index];

              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  controller.selectTrip(tripId);
                  TripViewerDialog.show(
                    context: context,
                    tripId: tripId,
                    onExplore: () => {},
                  );
                },
                child: TripCard(tripId: tripId),
              );
            },
          ),
        ),
      ),
    );
  }
}
