// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_actions.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/waypoint_handler.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_form_dialog.dart';

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

/// Construit la rangée "Modifier / Supprimer", identique pour la version
/// Dialog et la version BottomSheet. À passer tel quel en `buttonsBuilder`
/// de DialogShell ou de BottomSheetShell (même signature de callback).
List<Widget> buildWaypointViewerButtons({
  required BuildContext context,
  required WidgetRef ref,
  required TripId tripId,
  required WaypointId waypointId,
  required Waypoint waypoint,
}) {
  return [
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
        waypointId: waypointId,
      ),
    ),
  ];
}
