import 'package:domain_core/domain_core.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/map_state_provider.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/graph_store.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/graph_queries.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/trip_domain_queries.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/adapters/vertex_marker_adapter.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/elements.dart';
part 'vertex_ui_queries.g.dart';

@riverpod
List<VertexRef> vertexRefs(Ref ref) {
  final confirmedRefs = ref
      .watch(vertexStoreProvider)
      .getIds()
      .map(ConfirmedVertexRef.new);

  final pendingRefs = ref
      .watch(vertexPatchStoreProvider)
      .getIds()
      .map(PendingVertexRef.new);

  final Map<String, VertexRef> byKey = {
    for (final r in confirmedRefs) r.id.value: r,
    for (final r in pendingRefs) r.id.value: r, // écrase les confirmed
  };

  return byKey.values.toList();
}

@riverpod
VertexUiElement vertexUiElement(Ref ref, TripId tripId, VertexRef vertexRef) {
  final VertexUiModel vertexUi = switch (vertexRef) {
    PendingVertexRef e => ref.watch(vertexPatchProvider(e.id))!.toUiModel(),
    ConfirmedVertexRef e => ref.watch(vertexProvider(e.id))!.toUiModel(),
  };

  final Waypoint? w = ref.watch(
    waypointFromVertexProvider(Id<Vertex>(vertexRef.id.toString())),
  );
  if (w != null) {
    return WaypointUiElement(tripId, vertexUi, w);
  }
  return VertexUiElement(tripId, vertexUi);
}

@riverpod
List<DragMarker> vertexMarkers(Ref ref, Id<Trip> tripId) {
  final mapState = ref.watch(mapStateProvider(tripId).notifier);
  final vertexIds = ref.watch(vertexRefsProvider);
  final List<DragMarker> listDragMarkers = [];
  for (final vertexRef in vertexIds) {
    final vertex = ref.watch(vertexUiElementProvider(tripId, vertexRef));
    listDragMarkers.add(toVertexMarker(vertex, tripId, mapState));
  }
  return listDragMarkers;
}
