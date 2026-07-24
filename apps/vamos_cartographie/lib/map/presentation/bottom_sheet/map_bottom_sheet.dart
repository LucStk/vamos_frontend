// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/application/map_state.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/map_state_provider.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/bottom_sheet.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/sketch_bottom_sheet.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/vertex_bottom_sheet.dart';
import 'package:vamos_cartographie/map/presentation/waypoint_sheet/waypoint_sheet.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';

class MapBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const MapBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Avec ConsumerState, ref est accessible directement dans toute la classe via "ref"
    final modeSelection = ref.watch(
      mapStateProvider(tripId).select((mode) => mode.mode),
    );
    final stateSelection = ref.watch(
      mapStateProvider(tripId).select((state) => state.selection),
    );
    switch (modeSelection) {
      case SketchMode _:
        return SketchBottomSheet(tripId: tripId);
      case Idle _:
        switch (stateSelection) {
          case CursorSelection _:
            return CursorBottomSheet(tripId: tripId);
          case VertexSelection e:
            final waypointId = ref.watch(
              waypointFromVertexProvider(tripId, e.vertexId),
            );
            if (waypointId != null) {
              return WaypointBottomSheet(
                tripId: tripId,
                waypointId: waypointId,
              );
            }
            return VertexBottomSheet(tripId: tripId, vertexId: e.vertexId);
          case SegmentSelection _:
            return const SizedBox.shrink();
          case NoSelection _:
            return const SizedBox.shrink();
        }
    }
  }
}
