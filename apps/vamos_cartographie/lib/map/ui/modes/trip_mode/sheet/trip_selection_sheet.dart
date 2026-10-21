import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/ui/features/segment/sheet/segment_bottom_sheet_view.dart';
import 'package:vamos_cartographie/map/ui/features/waypoint/sheet/waypoint_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/sheet/trip_sheet.dart';

@Dependencies([modeMachine, modeSelection])
class TripSelectionSheet extends ConsumerWidget {
  const TripSelectionSheet({
    required this.tripId,
    required this.canEdit,
    super.key,
  });

  final TripId tripId;
  final bool canEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(modeSelectionProvider);

    return switch (selection) {
      MapWaypoint v => WaypointBottomSheet(
        key: ValueKey(v.id),
        tripId: tripId,
        waypointId: v.id,
      ),
      MapSegment s => SegmentBottomSheet(
        key: ValueKey(s.id),
        tripId: s.tripId,
        segmentId: s.id,
      ),
      _ => TripSheet(tripId: tripId, canEdit: canEdit),
    };
  }
}
