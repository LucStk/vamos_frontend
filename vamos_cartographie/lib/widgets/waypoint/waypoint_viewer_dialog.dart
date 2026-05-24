import 'package:flutter/material.dart';

import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/domain/domain.dart';
import '_waypoint_info.dart';
import "package:vamos_cartographie/widgets/shared/dialog_shell.dart";
import "package:vamos_cartographie/widgets/shared/buttons.dart";
import '_waypoint_editor.dart';

class WaypointViewerDialog extends StatefulWidget {
  final Waypoint waypoint;
  final VoidCallback? onEdit;

  const WaypointViewerDialog({
    super.key,
    required this.waypoint,
    required this.onEdit,
  });

  // ── Méthode statique show ─────────────────────────────────────────────────

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

// ── _WaypointCardState ────────────────────────────────────────────────────────

class _WaypointVewerDialogState extends State<WaypointViewerDialog> {
  String? _error;

  @override
  Widget build(BuildContext context) {
    return DialogShell(
      content: WaypointInfo(waypoint: widget.waypoint),
      buttons: [
        ModifierButton(
          onPressed: () {
            _showEditor(
              context: context,
              waypoint: widget.waypoint,
              onChanged: () {},
            );
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

  static void _onTypeChanged(GWaypointEnum newValue) {
    throw Exception(
      "Méthode onTypeChanged dans waypoint_viewer_dialog non implémenté",
    );
  }

  static void _showEditor({
    required BuildContext context,
    required Waypoint waypoint,
    required VoidCallback onChanged,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => DialogShell(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),
        content: WaypointEditor(
          waypoint: waypoint,
          onTypeChanged: _onTypeChanged,
          onCancel: () {},
          onConfirm: () {},
          onDelete: () {},
        ),
      ),
    );
  }
}
