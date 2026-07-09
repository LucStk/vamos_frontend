import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/map_state_provider.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/graph_store.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/graph_queries.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/trip_domain_queries.dart';
import 'package:vamos_cartographie/features/map_ui/map_ui.dart';

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
  final oldV = ref.read(vertexProvider(vertexRef.id as VertexId));
  final newV = ref.watch(vertexProvider(vertexRef.id as VertexId));
  print("equal? ${oldV == newV} $oldV, $newV");
  final VertexUiModel vertexUi = ref
      .watch(vertexProvider(vertexRef.id as VertexId))!
      .toUiModel();
  // switch (vertexRef) {
  //   PendingVertexRef e => ref.watch(vertexPatchProvider(e.id))?.toUiModel(),
  //   ConfirmedVertexRef e => ref.watch(vertexProvider(e.id))?.toUiModel(),
  // };
  if (vertexUi == null) {
    throw NotFoundFailure(
      resourceId: "$vertexRef",
      resourceType: "VertexUiModel",
    );
  }

  final Waypoint? w = ref.watch(
    waypointFromVertexProvider(Id<Vertex>(vertexRef.id.toString())),
  );
  if (w != null) {
    return WaypointUiElement(tripId, vertexUi, w);
  }
  return VertexUiElement(tripId, vertexUi);
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
