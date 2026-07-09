// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/waypoint_ui_queries.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/bottom_sheet/waypoint_bottom_sheet_content.dart';

// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
class WaypointViewerBottomSheet extends ConsumerStatefulWidget {
  final WaypointId waypointId;
  final TripId tripId;

  const WaypointViewerBottomSheet({
    super.key,
    required this.waypointId,
    required this.tripId,
  });

  @override
  ConsumerState<WaypointViewerBottomSheet> createState() =>
      _WaypointViewerBottomSheetState();
}

class _WaypointViewerBottomSheetState
    extends ConsumerState<WaypointViewerBottomSheet> {
  // On initialise l'état à true car initialChildSize == minChildSize (0.10)
  bool _isAtMin = true;

  @override
  Widget build(BuildContext context) {
    // Avec ConsumerState, ref est accessible directement dans toute la classe via "ref"
    final waypoint = ref.watch(waypointUiProvider(widget.waypointId));
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
