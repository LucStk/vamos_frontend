import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/adapters/vertex_marker_adapter.dart';

import 'package:vamos_cartographie/core/injection/injection.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider(tripId).notifier);
    final vertexIds = ref.watch(vertexRefsProvider);

    final List<DragMarker> listDragMarkers = [];
    for (final vertexRef in vertexIds) {
      final vertex = ref.watch(vertexUiElementProvider(tripId, vertexRef));
      listDragMarkers.add(toVertexMarker(vertex, tripId, mapState));
    }

    return DragMarkers(markers: listDragMarkers);
  }
}
