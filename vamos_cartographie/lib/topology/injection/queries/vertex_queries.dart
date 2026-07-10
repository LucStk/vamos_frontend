import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/services/add_listener_to_observable.dart';
import '/map/map.dart';
import '/topology/injection/injection.dart';
import '/waypoint/injection/waypoint_queries.dart';

part 'vertex_queries.g.dart';

@riverpod
ObservableGraphNode<Vertex> vertexNode(Ref ref, VertexId id) {
  final store = ref.watch(vertexStoreProvider);
  final node = store.getNode(id);
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "vertexNode", resourceId: "$id"),
    );
  }
  addListenerRebuild(ref, node);
  return node;
}

@riverpod
ObservableGraphNode<VertexPatch> vertexPatchNode(Ref ref, Id<VertexPatch> id) {
  final store = ref.watch(vertexPatchStoreProvider);
  final node = store.getNode(id);
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "vertexPatchNode", resourceId: "$id"),
    );
  }
  addListenerRebuild(ref, node);
  return node;
}

@riverpod
Vertex vertex(Ref ref, VertexId id) {
  final node = ref.watch(vertexNodeProvider(id));
  return node.value;
}

@riverpod
VertexPatch vertexPatch(Ref ref, Id<VertexPatch> id) {
  final node = ref.watch(vertexPatchNodeProvider(id));
  return node.value;
}

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
VertexElement vertexUiElement(Ref ref, TripId tripId, VertexRef vertexRef) {
  final vertexUi = switch (vertexRef) {
    PendingVertexRef e => ref.watch(vertexPatchProvider(e.id)).toUiModel(),
    ConfirmedVertexRef e => ref.watch(vertexProvider(e.id)).toUiModel(),
  };

  final Waypoint? w = ref.watch(
    waypointFromVertexProvider(Id<Vertex>(vertexRef.id.toString())),
  );
  if (w != null) {
    return WaypointElement(tripId, vertexUi, w);
  }
  return VertexElement(tripId, vertexUi);
}

@riverpod
bool isVertexSelected(Ref ref, TripId tripId, VertexRef vertexRef) {
  final mapState = ref.watch(mapStateProvider(tripId));
  return switch (mapState.selection) {
    VertexSelection e => (vertexRef == e.vertexRef),
    WaypointSelection e => (vertexRef == e.vertexRef),
    _ => false,
  };
}
