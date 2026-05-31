import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/presentation/widgets/widgets.dart';

import 'package:vamos_cartographie/shared/widgets/widgets.dart';

class WaypointFormDialog extends ConsumerStatefulWidget {
  final WaypointDraft initialWaypoint;
  final Future<void> Function(WidgetRef ref, WaypointDraft waypoint) onSubmit;
  final String successMessage;

  const WaypointFormDialog({
    super.key,
    required this.initialWaypoint,
    required this.onSubmit,
    required this.successMessage,
  });

  @override
  ConsumerState<WaypointFormDialog> createState() => _WaypointFormDialogState();
}

class _WaypointFormDialogState extends ConsumerState<WaypointFormDialog> {
  final _editorKey = GlobalKey<WaypointEditorState>();

  bool _isSaving = false;

  Future<void> _submit() async {
    final waypoint = _editorKey.currentState?.currentWaypoint;
    if (waypoint == null) return;

    setState(() {
      _isSaving = true;
    });

    try {
      await widget.onSubmit(ref, waypoint);

      if (!mounted) return;

      Navigator.of(context).pop();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(widget.successMessage)));
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DialogShell(
      constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

      content: WaypointEditor(
        key: _editorKey,
        initialWaypoint: widget.initialWaypoint,
      ),

      buttonsBuilder: (ctx) => [
        CancelButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        const Spacer(),

        ConfirmButton(isLoading: _isSaving, onPressed: _submit),
      ],
    );
  }
}
