// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/topology/injection/queries/vertex_queries.dart';
import 'package:vamos_cartographie/map/features/trip_map/injection/editor_controller_provider.dart';
import 'package:vamos_cartographie/map/features/trip_map/presentation/overlay_viewer/overlay_viewer.dart';
import 'sketch_sheet/sketch_sheet.dart';
import 'vertex_bottom_sheet.dart';
import '/domain_features/domain_features.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([MapEditor])
class MapEditorBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const MapEditorBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Avec ConsumerState, ref est accessible directement dans toute la classe via "ref"
    final editorMode = ref.watch(mapEditorProvider(tripId));

    switch (editorMode) {
      case SketchMode _:
        return SketchBottomSheet(tripId: tripId);
      case Idle _:
        switch (editorMode.selection) {
          case MapVertex e:
            final waypointId = ref.watch(
              waypointFromVertexProvider(tripId, e.id),
            );
            if (waypointId != null) {
              return WaypointBottomSheet(
                tripId: tripId,
                waypointId: waypointId,
              );
            }
            return VertexBottomSheet(tripId: tripId, vertexId: e.id);
          case MapSegment e:
            return SegmentBottomSheet(tripId: tripId, segmentId: e.id);
          case _:
            return const SizedBox.shrink();
        }
    }
  }
}
