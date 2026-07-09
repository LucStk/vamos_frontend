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

  static Future<void> show({
    required BuildContext context,
    required WaypointId waypointId,
    required TripId tripId,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      constraints: const BoxConstraints(maxWidth: 560),
      builder: (_) =>
          WaypointViewerBottomSheet(waypointId: waypointId, tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointUiProvider(waypointId));
    if (waypoint == null) {
      return const SizedBox.shrink();
    }

    return BottomSheetShell(
      content: WaypointViewerContent(waypoint: waypoint),
      buttonsBuilder: (ctx) => buildWaypointViewerButtons(
        context: ctx,
        ref: ref,
        tripId: tripId,
        waypointId: waypointId,
        waypoint: waypoint,
      ),
    );
  }
}
