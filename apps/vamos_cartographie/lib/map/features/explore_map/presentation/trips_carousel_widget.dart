import 'package:domain_core/domain/collection_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import '../injection/explore_mode.dart';
import '../injection/explore_scene.dart';
import '/domain_features/domain_features.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import 'trip_card.dart';

@Dependencies([MapExplore])
class TripsCarouselWidget extends ConsumerWidget {
  const TripsCarouselWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripStore = ref.watch(tripStoreProvider).tripStore;
    final tripIds = tripStore.getIds();

    if (tripIds.isEmpty) {
      return const SizedBox.shrink();
    }
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
                  final trip = ref.read(mapTripObjectProvider(tripId));
                  ref
                      .read(mapExploreProvider.notifier)
                      .act((m) => IdleExplorerIntents.selectTrip(trip));
                  //                   TripViewerDialog.show(
                  //                     context: context,
                  //                     tripId: tripId,
                  //                     onExplore: () {
                  //                       final vision = CameraVision(
                  //                         bounds: ref
                  //                             .read(mapCameraProvider)
                  //                             .visibleBounds, // ⚠️ adapte le nom du getter
                  //                       );
                  //
                  //                       TripRoute(
                  //                         tripId: tripId.value,
                  //                         $extra: vision,
                  //                       ).push(context);
                  //                     },
                  //                   );
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
