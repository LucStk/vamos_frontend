// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/application/applications.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/injection.dart';
import 'package:vamos_cartographie/features/map_ui/presentation/bottom_sheet/waypoint_bottom_sheet_content.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_queries.dart';

// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
class WaypointBottomSheet extends ConsumerStatefulWidget {
  final TripId tripId;

  const WaypointBottomSheet({super.key, required this.tripId});

  @override
  ConsumerState<WaypointBottomSheet> createState() =>
      _WaypointViewerBottomSheetState();
}

class _WaypointViewerBottomSheetState
    extends ConsumerState<WaypointBottomSheet> {
  // On initialise l'état à true car initialChildSize == minChildSize (0.10)
  bool _isAtMin = true;

  @override
  Widget build(BuildContext context) {
    // Avec ConsumerState, ref est accessible directement dans toute la classe via "ref"
    final selectedWaypointId = ref.watch(
      mapStateProvider(widget.tripId).select(
        (state) => switch (state.selection) {
          WaypointSelection(:final waypointId) => waypointId,
          _ => null,
        },
      ),
    );
    if (selectedWaypointId == null) {
      return const SizedBox.shrink();
    }
    final waypoint = ref.watch(waypointUiProvider(selectedWaypointId));

    if (waypoint == null) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: DraggableScrollableSheet(
          initialChildSize: 0.10,
          minChildSize: 0.10,
          maxChildSize: 0.90,
          expand: false,
          builder: (context, scrollController) {
            return Material(
              elevation: 8,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  final atMin =
                      notification.extent <= (notification.minExtent + 0.01);

                  // On met à jour l'état seulement si la valeur change pour éviter des rebuilds inutiles
                  if (_isAtMin != atMin) {
                    setState(() {
                      _isAtMin = atMin;
                    });
                  }
                  return false; // Changé à false pour permettre à la notification de continuer à se propager si besoin
                },
                // Condition pour intervertir WidgetA et WidgetB
                child: WaypointBottomSheetContent(
                  tripId: widget.tripId,
                  waypoint: waypoint,
                  scrollController: scrollController,
                  isAtMin: _isAtMin, // 👈 On passe l'état ici
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
