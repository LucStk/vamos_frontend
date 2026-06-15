import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'tap_menu.dart';
import 'package:flutter/widgets.dart';

class PendingWaypointLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const PendingWaypointLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider(tripId));
    final notifier = ref.read(mapStateProvider(tripId).notifier);

    return mapState.interaction.maybeMap(
      creatingWaypoint: (interaction) {
        return DragMarkers(
          markers: [
            DragMarker(
              size: const Size(250, 100),
              point: interaction.position,

              onDragUpdate: (_, latLng) {
                notifier.updatePendingWaypointPosition(latLng);
              },

              builder: (context, point, isDragging) {
                return MenuCard(onClose: notifier.cancelInteraction);
              },
            ),
          ],
        );
      },

      orElse: () => const SizedBox.shrink(),
    );
  }
}
