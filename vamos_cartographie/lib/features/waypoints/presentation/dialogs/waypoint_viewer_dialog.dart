import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import "package:vamos_cartographie/features/graph/graph.dart";
import 'package:vamos_cartographie/features/waypoints/application/orchestrators/waypoint_orchestrator.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'waypoint_editor_dialog.dart';

import "package:vamos_cartographie/features/shared/shared.dart";

class WaypointViewerDialog extends ConsumerWidget {
  final int waypointId;
  final int tripId;

  const WaypointViewerDialog({
    super.key,
    required this.waypointId,
    required this.tripId,
  });

  static void show({
    required BuildContext context,
    required int waypointId,
    required int tripId,
  }) {
    showDialog(
      context: context,
      builder: (_) =>
          WaypointViewerDialog(waypointId: waypointId, tripId: tripId),
    );
  }

  Future<void> _deleteWaypoint(BuildContext context, WidgetRef ref) async {
    // On appelle la méthode statique qu'on a créée au-dessus
    final confirmed = await AskConfirmDialog.show(
      context,
      "Voulez vous vraiment supprimer ce point ? Cette action est irréversible.",
    );

    // Si l'utilisateur a annulé ou cliqué à côté de la boîte de dialogue
    if (confirmed != true) return;

    try {
      // Appel à Riverpod pour supprimer dans le state / serveur
      await ref
          .read(waypointOrchestratorProvider(tripId).notifier)
          .deleteWaypoint(waypointId);

      // Sécurité Flutter obligatoire après un "await"
      if (!context.mounted) return;

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Waypoint supprimé avec succès')),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la suppression : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref
        .read(graphStoreProvider)
        .map<Waypoint>()[waypointId]
        ?.value;
    if (waypoint == null) {
      return const SizedBox.shrink();
    }
    return DialogShell(
      content: WaypointInfo(waypoint: waypoint),

      buttonsBuilder: (ctx) => [
        ModifierButton(
          onPressed: () {
            WaypointEditorDialog.show(
              context: ctx,
              waypointId: waypointId,
              tripId: tripId,
            );
          },
        ),

        const SizedBox(width: 8),

        DeleteButton(
          onPressed: () {
            _deleteWaypoint(context, ref);
          },
        ),
      ],
    );
  }
}
