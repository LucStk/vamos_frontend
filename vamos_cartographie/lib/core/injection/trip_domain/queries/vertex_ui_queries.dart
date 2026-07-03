import 'package:domain_core/domain_core.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/map_state_provider.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/graph_store.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/graph_queries.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/trip_domain_queries.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/adapters/marker_adapter.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex_ui_element.dart';
part 'vertex_ui_queries.g.dart';

@riverpod
List<VertexRef> vertexRefs(Ref ref) {
  final Set<VertexRef> vertexPatchIds = ref
      .watch(vertexPatchStoreProvider)
      .getIds()
      .cast<VertexRef>()
      .toSet();
  final Set<VertexRef> vertexIds = ref
      .watch(vertexStoreProvider)
      .getIds()
      .cast<VertexRef>()
      .toSet();

  return vertexIds.union(vertexPatchIds).toList();
}

@riverpod
VertexUiModel? vertexUi(Ref ref, VertexRef id) {
  switch (id) {
    case PendingVertexRef e:
      final VertexPatch? vPatch = ref.watch(vertexPatchProvider(e.id));
      return vPatch?.toUiModel(null);
    case ConfirmedVertexRef e:
      final Vertex? v = ref.watch(vertexProvider(e.id));
      if (v == null) {
        return null;
      }
      final Waypoint? w = ref.watch(waypointFromVertexProvider(v.id));
      return v.toUiModel(w?.poiCategory);
  }
}

@riverpod
List<DragMarker> vertexMarkers(Ref ref, Id<Trip> tripId) {
  final mapState = ref.read(mapStateProvider(tripId).notifier);
  final vertexIds = ref.watch(vertexRefsProvider);
  return [
    for (final vertexRef in vertexIds)
      if (ref.watch(vertexUiProvider(vertexRef)) case final vertex?)
        toDragMarker(VertexUiElement(tripId, vertex), tripId, mapState),
  ];
}
