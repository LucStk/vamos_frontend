import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/features/explore_map/injection/explore_controller_provider.dart';
import 'package:vamos_cartographie/map/features/explore_map/presentation/dialogs/trip_viewer_dialog.dart';

import 'package:vamos_cartographie/map/camera/camera.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'trip_card.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/features/trip_map/trip_map.dart';

@Dependencies([
  mapEditorController,
  mapExploreController,
  tripEditorScene,
  cameraDirector,
  mapController,
  MapCameraHolder,
  MapCameraChanges,
  mapCameraSnapshot,
])
class DesktopTripsCarousel extends ConsumerWidget {
  const DesktopTripsCarousel({super.key, required this.tripIds});

  final List<TripId> tripIds;

  void _explore(BuildContext context, TripId tripId) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => TripMapScreen(tripId: tripId)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  ref.read(mapExploreControllerProvider).selectTrip(tripId);
                  TripViewerDialog.show(
                    context: context,
                    tripId: tripId,
                    onExplore: () => _explore(context, tripId),
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
