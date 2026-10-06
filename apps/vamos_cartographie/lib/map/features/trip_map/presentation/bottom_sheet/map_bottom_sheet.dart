// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import '/domain_features/domain_features.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import 'create_vertex_bt_sheet.dart';
import 'segment/segment_bottom_sheet_view.dart';
import 'segment/sketch_bottom_sheet.dart';
import 'vertex/vertex_bottom_sheet.dart';
import 'vertex/waypoint_bottom_sheet.dart';

@Dependencies([])
class MapEditorBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const MapEditorBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Avec ConsumerState, ref est accessible directement dans toute la classe via "ref"
    final editorMode = ref.watch(mapEditorProvider(tripId));

    switch (editorMode) {
      case InitTripMode _:
        return CreateVertexBottomSheet();
      case SketchMode _:
        return SketchBottomSheet(tripId: tripId);
      case VertexSelectMode e:
        final waypointId = ref.watch(
          waypointFromVertexProvider(tripId, e.vertex.id),
        );
        if (waypointId != null) {
          return WaypointBottomSheet(tripId: tripId, waypointId: waypointId);
        }
        return VertexBottomSheet(tripId: tripId, vertexId: e.vertex.id);
      case SegmentSelectMode e:
        return SegmentBottomSheet(tripId: tripId, segmentId: e.segment.id);
      case _:
        return const SizedBox.shrink();
    }
  }
}
