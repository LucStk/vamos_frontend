import 'package:flutter/material.dart';
import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'package:vamos_cartographie/shared/shared.dart';
import '_waypoint_info.dart';
import '_waypoint_editor.dart';

class WaypointViewerDialog extends StatefulWidget {
  final Waypoint waypoint;
  final VoidCallback? onEdit;

  const WaypointViewerDialog({
    super.key,
    required this.waypoint,
    required this.onEdit,
  });

  static void show({
    required BuildContext context,
    required Waypoint waypoint,
    required VoidCallback onEdit,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => WaypointViewerDialog(waypoint: waypoint, onEdit: onEdit),
    );
  }

  @override
  State<WaypointViewerDialog> createState() => _WaypointVewerDialogState();
}

class _WaypointVewerDialogState extends State<WaypointViewerDialog> {
  String? _error;

  @override
  Widget build(BuildContext context) {
    return DialogShell(
      content: WaypointInfo(waypoint: widget.waypoint),

      buttonsBuilder: (ctx) => [
        ModifierButton(
          onPressed: () {
            _showEditor(context: context, waypoint: widget.waypoint);
          },
        ),

        const SizedBox(width: 8),

        DeleteButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  static void _showEditor({
    required BuildContext context,
    required Waypoint waypoint,
  }) async {
    // Une clé pour pouvoir lire l'état du formulaire depuis le bouton "Confirmer"
    final editorKey = GlobalKey<WaypointEditorState>();

    final Waypoint? result = await showDialog<Waypoint>(
      context: context,
      barrierDismissible: false,
      // On type explicitement le DialogShell avec <Waypoint>
      builder: (ctx) => DialogShell<Waypoint>(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

        // L'enfant reçoit la clé
        content: WaypointEditor(key: editorKey, initialWaypoint: waypoint),

        // Le builder nous donne "ctx" (le BuildContext de la modal)
        buttonsBuilder: (ctx) => [
          CancelButton(onPressed: () => Navigator.pop(ctx)), // Ferme sans data

          const Spacer(),

          // ── Confirmer ──────────────────────────
          FilledButton(
            onPressed: () async {
              // On récupère le waypoint directement dans l'état de l'enfant !
              final editedWaypoint = editorKey.currentState?.currentWaypoint;

              if (editedWaypoint != null) {
                try {
                  // repository.updateWaypoint(editedWaypoint);

                  // On ferme la modal (ctx) EN RENVOYANT la donnée
                  Navigator.pop(ctx, editedWaypoint);
                } catch (e) {
                  debugPrint(e.toString());
                }
              }
            },
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );

    if (result != null) {
      // Ton parent récupère proprement le waypoint modifié ici !
    }
  }
}
