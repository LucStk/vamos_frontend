import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/features/segment/sheet/segment_bottom_sheet_view.dart';
import 'package:vamos_cartographie/map/ui/features/sketch/sheet/sketch_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/features/waypoint/sheet/waypoint_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/sheet/trip_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class TripModeSheetUi extends ConsumerWidget {
  const TripModeSheetUi(this.mode, {super.key});

  final TripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(modeSelectionProvider);

    return switch ((mode, selection)) {
      (SketchMode _, _) => SketchBottomSheet(
        onTypeChanged: (_) {},
        stopSketch: () {},
      ),
      (TripMode e, null) => TripSheet(tripId: e.tripId, mode: mode),
      (TripViewMode e, MapWaypoint v) => WaypointBottomSheet(
        key: ValueKey(v.id),
        tripId: e.tripId,
        waypointId: v.id,
      ),
      (TripMode _, MapSegment s) => SegmentBottomSheet(
        key: ValueKey(s.id),
        tripId: s.tripId,
        segmentId: s.id,
      ),
      _ => const SizedBox.shrink(),
    };
  }
}
