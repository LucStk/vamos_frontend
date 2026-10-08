// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import '../../injection/map_editor_mode.dart';
import '/domain_features/domain_features.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import 'segment/segment_bottom_sheet_view.dart';
import 'segment/sketch_bottom_sheet.dart';
import 'vertex/vertex_bottom_sheet.dart';
import 'vertex/waypoint_bottom_sheet.dart';

@Dependencies([MapEditor])
class MapEditorBottomSheet extends ConsumerWidget {
  const MapEditorBottomSheet({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSketch = ref.watch(
      mapEditorProvider(tripId).select((s) => s.mode is SketchMode),
    );
    if (isSketch) return SketchBottomSheet(tripId: tripId);

    final selected = ref.watch(
      mapEditorProvider(tripId).select((s) => s.context.get(selectionSlot)),
    );

    return switch (selected) {
      VertexSelection(:final id) => _VertexSheet(
        key: ValueKey(id),
        tripId: tripId,
        vertexId: id,
      ),
      SegmentSelection(:final id) => SegmentBottomSheet(
        key: ValueKey(id),
        tripId: tripId,
        segmentId: id,
      ),
      TripSelection() || null => const SizedBox.shrink(),
    };
  }
}

@Dependencies([MapEditor])
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
