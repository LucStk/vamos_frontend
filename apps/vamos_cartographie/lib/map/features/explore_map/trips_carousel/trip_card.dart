import 'package:domain_core/domain/collection_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/trip.dart';
import '/domain_features/trip/injection/trip_store.dart';
import '/map/features/explore_map/explore_map.dart';

class TripCard extends ConsumerWidget {
  const TripCard({super.key, required this.tripId});

  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripStore = ref.watch(tripStoreProvider).tripStore;
    final trip = tripStore.get(tripId);

    if (trip == null) {
      return const SizedBox.shrink();
    }

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      color: Theme.of(context).colorScheme.surfaceContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TripCardContent(trip: trip),
        ),
      ),
    );
  }
}
