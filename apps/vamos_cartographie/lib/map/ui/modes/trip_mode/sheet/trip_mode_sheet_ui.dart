import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/topology/topology.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/features/segment/sheet/segment_bottom_sheet_view.dart';
import 'package:vamos_cartographie/map/ui/features/sketch/sheet/sketch_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/features/waypoint/sheet/vertex_bottom_sheet_content.dart';
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
      (TripViewMode e, MapWaypoint v) => _VertexSheet(
        key: ValueKey(v.id),
        tripId: e.tripId,
        vertexId: v.id,
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

@Dependencies([])
class _VertexSheet extends ConsumerWidget {
  const _VertexSheet({super.key, required this.tripId, required this.vertexId});

  final TripId tripId;
  final WaypointId vertexId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypointId = ref.watch(waypointFromVertexProvider(tripId, vertexId));

    return waypointId != null
        ? WaypointBottomSheet(tripId: tripId, waypointId: waypointId)
        : VertexBottomSheetContent(tripId: tripId, vertexId: vertexId);
  }
}
