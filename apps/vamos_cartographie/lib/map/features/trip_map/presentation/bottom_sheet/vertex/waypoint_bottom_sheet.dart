import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';

import '../../../../../overlay_ui/draggable_sheet/draggable_bottom_sheet_shell.dart';
import '/domain_features/domain_features.dart';
import 'waypoint_compact_content.dart';
import 'waypoint_viewer_content.dart';

class WaypointBottomSheet extends ConsumerWidget {
  final TripId tripId;
  final WaypointId waypointId;

  const WaypointBottomSheet({
    super.key,
    required this.tripId,
    required this.waypointId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointProvider(tripId, waypointId));

    return DraggableBottomSheetShell(
      compactContent: WaypointCompactContent(
        tripId: tripId,
        waypoint: waypoint,
      ),
      expandedContent: WaypointViewerContent(waypoint: waypoint),
    );
  }
}
