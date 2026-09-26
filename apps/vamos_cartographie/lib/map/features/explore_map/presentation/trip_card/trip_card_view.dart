import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/map/map.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/routing/routing.dart';
import '/domain_features/domain_features.dart';

// ── Card ─────────────────────────────────────────────────────────────────────
@Dependencies([
  mapGestureHandler,
  MapEditor,
  tripEditorScene,
  cameraDirector,
  mapCamera,
  MapCameraChanges,
  mapCameraSnapshot,
])
class TripCardView extends ConsumerWidget {
  final Id<Trip> tripId;

  const TripCardView({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripProvider(tripId));
    if (trip == null) {
      throw Exception("TripCard -> tripId not found in tripByIdProvider");
    }
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => TripRoute(tripId: tripId.value).go(context),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 4, 14),
          child: Row(
            children: [
              TripCardIcon(),
              const SizedBox(width: 14),
              TripCardContent(trip: trip),
            ],
          ),
        ),
      ),
    );
  }
}
