// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/topology/topology.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/features/segment/sheet/segment_bottom_sheet_view.dart';
import 'package:vamos_cartographie/map/ui/features/segment/sheet/sketch_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/features/trip/sheet/trip_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/features/vertex/sheet/vertex_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/features/waypoint/sheet/waypoint_bottom_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class MapUi extends ConsumerWidget {
  const MapUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(modeStateProvider.select((m) => m.mode));
    final selection = ref.watch(modeSelectionProvider);

    switch ((mode, selection)) {
      case (ExploreMode _, _):
        return SizedBox.shrink();
      case (SketchMode _, _):
        return SketchBottomSheet(onTypeChanged: (_) {}, stopSketch: () {});
      case (TripMode e, null):
        return TripBottomSheet(tripId: e.tripId);
      case (TripViewMode _, MapVertex v):
        return _VertexSheet(
          key: ValueKey(v.id),
          tripId: v.tripId,
          vertexId: v.id,
        );
      case (TripMode _, MapSegment s):
        return SegmentBottomSheet(
          key: ValueKey(s.id),
          tripId: s.tripId,
          segmentId: s.id,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

@Dependencies([])
class _VertexSheet extends ConsumerWidget {
  const _VertexSheet({super.key, required this.tripId, required this.vertexId});
  final TripId tripId;
  final VertexId vertexId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypointId = ref.watch(waypointFromVertexProvider(tripId, vertexId));
    return waypointId != null
        ? WaypointBottomSheet(tripId: tripId, waypointId: waypointId)
        : VertexBottomSheet(tripId: tripId, vertexId: vertexId);
  }
}
