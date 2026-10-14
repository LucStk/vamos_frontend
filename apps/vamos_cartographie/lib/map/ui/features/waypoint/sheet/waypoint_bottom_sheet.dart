import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/ui/features/waypoint/sheet/waypoint_compact_content.dart';
import 'package:vamos_cartographie/map/ui/features/waypoint/sheet/waypoint_viewer_content.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/draggable_sheet.dart';

@Dependencies([])
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
