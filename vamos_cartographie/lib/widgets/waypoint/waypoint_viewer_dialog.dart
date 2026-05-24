import 'package:flutter/material.dart';

import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/domain/domain.dart';

import '_waypoint_info.dart';
import '_waypoint_editor.dart';

import "package:vamos_cartographie/widgets/shared/dialog_shell.dart";
import "package:vamos_cartographie/widgets/shared/buttons.dart";

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

      buttons: [
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
  }) {
    // ── Draft partagé ─────────────────────────────

    final draft = ValueNotifier<Waypoint>(waypoint);

    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (ctx) => DialogShell(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

        content: WaypointEditor(draft: draft),

        buttons: [
          // ── Annuler ─────────────────────────────
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Annuler'),
          ),

          const Spacer(),

          // ── Confirmer ──────────────────────────
          FilledButton(
            onPressed: () async {
              final editedWaypoint = draft.value;
              try {
                // TODO :
                // appeler ton repository Ferry ici

                // Exemple :
                //
                // final updatedWaypoint =
                //    await repository.updateWaypoint(
                //      editedWaypoint,
                //    );

                Navigator.pop(ctx, editedWaypoint);
              } catch (e) {
                debugPrint(e.toString());
              }
            },

            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }
}
