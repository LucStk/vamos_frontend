// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_actions.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_handler.dart';
import 'package:vamos_cartographie/waypoint/presentation/presentation.dart';

/// Confirme puis supprime le waypoint, et ferme la vue courante
/// (Dialog ou BottomSheet — dans les deux cas `Navigator.of(context).pop()`
/// fonctionne, car les deux sont poussés comme une route).
Future<void> deleteWaypointWithConfirmation({
  required BuildContext context,
  required WidgetRef ref,
  required TripId tripId,
  required WaypointId waypointId,
}) async {
  final confirmed = await AskConfirmDialog.show(
    context,
    "Voulez vous vraiment supprimer ce point ? Cette action est irréversible.",
  );

  if (confirmed != true) return;

  final res = await ref
      .read(waypointHandlerProvider(tripId))
      .deleteWaypoint(waypointId);

  if (!context.mounted) return;

  if (res.isRight()) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Waypoint supprimé avec succès')),
    );
  }
}

class WaypointViewerButtons extends ConsumerWidget {
  final TripId tripId;
  final Waypoint waypoint;
  const WaypointViewerButtons({
    super.key,
    required this.tripId,
    required this.waypoint,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ModifierButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) =>
                  WaypointFormDialog(tripId: tripId, initialWaypoint: waypoint),
            );
          },
        ),
        const SizedBox(width: 8),
        DeleteButton(
          onPressed: () => deleteWaypointWithConfirmation(
            context: context,
            ref: ref,
            tripId: tripId,
            waypointId: waypoint.id,
          ),
        ),
      ],
    );
  }
}
