import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/application/map_state.dart';
import 'package:trip_application/trip_application.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import '/map/map.dart';

import "adapters/adapters.dart";

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapStateNotifier = ref.read(mapStateProvider(tripId).notifier);
    final mapMode = ref.watch(mapStateProvider(tripId).select((s) => s.mode));
    final vertexIds = ref.watch(vertexRefsProvider);

    final isSketchMode = mapMode is SketchMode;

    final List<DragMarker> listDragMarkers = [];
    for (final vertexRef in vertexIds) {
      final vertex = ref.watch(vertexUiElementProvider(tripId, vertexRef));
      listDragMarkers.add(
        toVertexMarker(vertex, tripId, mapStateNotifier, isSketchMode),
      );
    }
    return DragMarkers(markers: listDragMarkers);
  }
}
