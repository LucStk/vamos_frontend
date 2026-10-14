// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([])
class MapBottomSheet extends ConsumerWidget {
  const MapBottomSheet({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSketch = ref.watch(
      mapEditorProvider(tripId).select((s) => s.mode is SketchMode),
    );
    if (isSketch) return SketchBottomSheet(tripId: tripId);

    final selected = ref.watch(
      mapEditorProvider(tripId).select((s) => s.slots.get(selectionSlot)),
    );

    return switch (selected) {
      MapVertex(:final id) => _VertexSheet(
        key: ValueKey(id),
        tripId: tripId,
        vertexId: id,
      ),
      MapSegment(:final id) => SegmentBottomSheet(
        key: ValueKey(id),
        tripId: tripId,
        segmentId: id,
      ),
      _ => const SizedBox.shrink(),
    };
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
