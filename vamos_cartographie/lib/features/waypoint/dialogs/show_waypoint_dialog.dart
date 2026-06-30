import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/waypoint_handler.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/waypoint_ui_queries.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/widgets.dart';
import 'edit_waypoint_dialog.dart';

import "package:vamos_cartographie/features/shared/shared.dart";

class ShowWaypointDialog extends ConsumerWidget {
  final WaypointId waypointId;
  final TripId tripId;
  const ShowWaypointDialog({
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
          ShowWaypointDialog(waypointId: waypointId, tripId: tripId),
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
          .read(waypointHandlerProvider(tripId))
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
    final waypoint = ref.watch(waypointUiProvider(waypointId));
    if (waypoint == null) {
      return const SizedBox.shrink();
    }

    return DialogShell(
      content: WaypointInfo(waypoint: waypoint),
      buttonsBuilder: (ctx) => [
        ModifierButton(
          onPressed: () {
            EditWaypointDialog.show(
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
