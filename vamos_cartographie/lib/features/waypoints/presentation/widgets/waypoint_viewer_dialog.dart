import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/map_notifier.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'package:vamos_cartographie/shared/shared.dart';

import 'waypoint_info.dart';

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(
      mapStateProvider(tripId).select(
        (state) => state.waypoints.firstWhere((w) => w.id == waypointId),
      ),
    );

    return DialogShell(
      content: WaypointInfo(waypoint: waypoint),

      buttonsBuilder: (ctx) => [
        ModifierButton(
          onPressed: () {
            ref
                .read(mapStateProvider(tripId).notifier)
                .openWaypointEditor(waypoint.id);
          },
        ),

        const SizedBox(width: 8),

        DeleteButton(
          onPressed: () {
            ref
                .read(mapStateProvider(tripId).notifier)
                .removeWaypointById(waypoint.id);
            Navigator.of(ctx).pop();
          },
        ),
      ],
    );
  }
}


// class WaypointViewerDialog extends ConsumerWidget {
//   final Waypoint waypoint;
//   final ValueChanged<Waypoint> onEdit;

//   const WaypointViewerDialog({
//     super.key,
//     required this.waypoint,
//     required this.onEdit,
//   });

//   static void show({
//     required BuildContext context,
//     required Waypoint waypoint,
//     required ValueChanged<Waypoint> onEdit,
//   }) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (_) => WaypointViewerDialog(waypoint: waypoint, onEdit: onEdit),
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final tripId = ref.read(currentTripIdProvider);
//     final waypoint = ref.watch(
//       mapStateProvider(tripId).select(
//         (state) => state.waypoints.firstWhere((w) => w.id == widget.waypointId),
//       ),
//     );
//     return DialogShell(
//       content: WaypointInfo(waypoint: widget.waypoint),

//       buttonsBuilder: (ctx) => [
//         ModifierButton(
//           onPressed: () async {
//             final editedWaypoint = await _showEditor(
//               context: context,
//               waypoint: widget.waypoint,
//             );

//             if (editedWaypoint != null) {
//               widget.onEdit(editedWaypoint);
//             }
//           },
//         ),

//         const SizedBox(width: 8),

//         DeleteButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }

//   static Future<Waypoint?> _showEditor({
//     required BuildContext context,
//     required Waypoint waypoint,
//   }) async {
//     final editorKey = GlobalKey<WaypointEditorState>();

//     return await showDialog<Waypoint>(
//       context: context,
//       barrierDismissible: false,
//       builder: (ctx) => DialogShell<Waypoint>(
//         constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

//         content: WaypointEditor(key: editorKey, initialWaypoint: waypoint),

//         buttonsBuilder: (ctx) => [
//           CancelButton(onPressed: () => Navigator.pop(ctx)),

//           const Spacer(),

//           FilledButton(
//             onPressed: () {
//               final editedWaypoint = editorKey.currentState?.currentWaypoint;

//               if (editedWaypoint != null) {
//                 Navigator.pop(ctx, editedWaypoint);
//               }
//             },
//             child: const Text('Confirmer'),
//           ),
//         ],
//       ),
//     );
//   }
// }


//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final tripId = ref.read(currentTripIdProvider);
//     final waypoint = ref.watch(
//       mapStateProvider(tripId).select(
//         (state) => state.waypoints.firstWhere((w) => w.id == widget.waypointId),
//       ),
//     );
//     return DialogShell(
//       content: WaypointInfo(waypoint: widget.waypoint),

//       buttonsBuilder: (ctx) => [
//         ModifierButton(
//           onPressed: () async {
//             final editedWaypoint = await _showEditor(
//               context: context,
//               waypoint: widget.waypoint,
//             );

//             if (editedWaypoint != null) {
//               widget.onEdit(editedWaypoint);
//             }
//           },
//         ),

//         const SizedBox(width: 8),

//         DeleteButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }

//   static Future<Waypoint?> _showEditor({
//     required BuildContext context,
//     required Waypoint waypoint,
//   }) async {
//     final editorKey = GlobalKey<WaypointEditorState>();

//     return await showDialog<Waypoint>(
//       context: context,
//       barrierDismissible: false,
//       builder: (ctx) => DialogShell<Waypoint>(
//         constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

//         content: WaypointEditor(key: editorKey, initialWaypoint: waypoint),

//         buttonsBuilder: (ctx) => [
//           CancelButton(onPressed: () => Navigator.pop(ctx)),

//           const Spacer(),

//           FilledButton(
//             onPressed: () {
//               final editedWaypoint = editorKey.currentState?.currentWaypoint;

//               if (editedWaypoint != null) {
//                 Navigator.pop(ctx, editedWaypoint);
//               }
//             },
//             child: const Text('Confirmer'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//  });
