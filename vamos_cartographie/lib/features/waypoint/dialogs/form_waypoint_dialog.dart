import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import "package:vamos_cartographie/features/shared/shared.dart";
import 'package:vamos_cartographie/features/waypoint/waypoint.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/widgets.dart';

class FormWaypointDialog extends ConsumerStatefulWidget {
  final Waypoint initialWaypoint;
  final Future<void> Function(WidgetRef ref, Waypoint waypoint) onSubmit;
  final VoidCallback? onSuccess;

  const FormWaypointDialog({
    super.key,
    required this.initialWaypoint,
    required this.onSubmit,
    this.onSuccess,
  });

  @override
  ConsumerState<FormWaypointDialog> createState() => _FormWaypointDialogState();
}

class _FormWaypointDialogState extends ConsumerState<FormWaypointDialog> {
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
      if (widget.onSuccess != null) widget.onSuccess!();
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
        initialWaypoint: WaypointUi(widget.initialWaypoint),
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
