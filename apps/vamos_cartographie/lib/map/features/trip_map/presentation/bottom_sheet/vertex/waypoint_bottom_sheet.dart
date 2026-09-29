import 'package:flutter/material.dart'; // Remplacé cupertino par material pour SizedBox et ListView standard
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import '/domain_features/domain_features.dart';
import '/map/map.dart';
import "waypoint_compact_content.dart";
import "waypoint_viewer_content.dart";

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([MapEditor])
class WaypointBottomSheet extends ConsumerWidget {
  final TripId tripId;
  final WaypointId waypointId;

  const WaypointBottomSheet({
    super.key,
    required this.tripId,
    required this.waypointId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointProvider(tripId, waypointId));

    return DraggableBottomSheetShell(
      tripId:
          tripId, // 1. Ne pas oublier de passer le tripId requis par le Shell
      compactContent: WaypointCompactContent(
        tripId: tripId,
        waypoint: waypoint,
      ),
      builder: ({isAtmin = true, required scrollController}) {
        // 2. Correction de la syntaxe des arguments nommés
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child:
              isAtmin // Attention à la casse "isAtmin" définie dans ton Shell
              ? WaypointCompactContent(
                  key: const ValueKey(
                    'compact',
                  ), // Crucial pour l'AnimatedSwitcher
                  waypoint: waypoint,
                  tripId: tripId,
                )
              : WaypointViewerContent(
                  key: const ValueKey(
                    'expanded',
                  ), // Crucial pour l'AnimatedSwitcher
                  waypoint: waypoint,
                ),
        );
      },
    );
  }
}
