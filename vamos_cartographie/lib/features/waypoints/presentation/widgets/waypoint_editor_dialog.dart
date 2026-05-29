import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/map_notifier.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'package:vamos_cartographie/shared/shared.dart';
import 'waypoint_editor.dart';

class WaypointEditorDialog extends ConsumerWidget {
  final int waypointId;
  final int tripId;

  const WaypointEditorDialog({
    super.key,
    required this.waypointId,
    required this.tripId,
  });

  static Future<Waypoint?> show({
    required BuildContext context,
    required int waypointId,
    required int tripId,
  }) {
    return showDialog<Waypoint>(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          WaypointEditorDialog(waypointId: waypointId, tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(
      mapStateProvider(tripId).select(
        (state) => state.waypoints.firstWhere((w) => w.id == waypointId),
      ),
    );

    final editorKey = GlobalKey<WaypointEditorState>();

    return DialogShell(
      constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

      content: WaypointEditor(key: editorKey, initialWaypoint: waypoint),

      buttonsBuilder: (ctx) => [
        CancelButton(onPressed: () => Navigator.pop(ctx)),

        const Spacer(),

        FilledButton(
          onPressed: () {
            final WaypointDraft? edited =
                editorKey.currentState?.currentWaypoint;

            if (edited != null) {
              ref
                  .read(mapStateProvider(tripId).notifier)
                  .updateWaypoint(waypointId, edited);
              Navigator.pop(ctx);
            }
          },
          child: const Text('Confirmer'),
        ),
      ],
    );
  }
}
