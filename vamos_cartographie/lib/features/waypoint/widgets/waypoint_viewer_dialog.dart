// Remplace le fichier existant :
// lib/features/waypoint/widgets/waypoint_viewer_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/waypoint_ui_queries.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_viewer_actions.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_viewer_content.dart';

import 'package:vamos_cartographie/features/shared/shared.dart';

class WaypointViewerDialog extends ConsumerWidget {
  final WaypointId waypointId;
  final TripId tripId;

  const WaypointViewerDialog({
    super.key,
    required this.waypointId,
    required this.tripId,
  });

  static void show({
    required BuildContext context,
    required WaypointId waypointId,
    required TripId tripId,
  }) {
    showDialog(
      context: context,
      builder: (_) =>
          WaypointViewerDialog(waypointId: waypointId, tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointUiProvider(waypointId));
    if (waypoint == null) {
      return const SizedBox.shrink();
    }

    return DialogShell(
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
