// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/waypoint_ui_queries.dart';
import 'package:vamos_cartographie/features/shared/shared.dart'; // doit exporter BottomSheetShell
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_viewer_actions.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_viewer_content.dart';

/// Pendant "BottomSheet" de [WaypointViewerDialog]. Même contenu
/// ([WaypointViewerContent]) et mêmes actions (modifier/supprimer),
/// affichés dans un [BottomSheetShell] au lieu d'un [DialogShell].
class WaypointViewerBottomSheet extends ConsumerWidget {
  final WaypointId waypointId;
  final TripId tripId;

  const WaypointViewerBottomSheet({
    super.key,
    required this.waypointId,
    required this.tripId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointUiProvider(waypointId));
    if (waypoint == null) {
      return const SizedBox.shrink();
    }
    return DraggableScrollableSheet(
      initialChildSize: 0.22,
      minChildSize: 0.22,
      maxChildSize: 0.90,
      builder: (context, scrollController) {
        return Material(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: WaypointViewerContent(waypoint: waypoint),
        );
      },
    );
  }
}
