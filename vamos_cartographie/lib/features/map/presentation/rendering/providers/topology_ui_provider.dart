import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/queries/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/markers/marker_ui_element.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

part 'topology_ui_provider.g.dart';

@riverpod
List<VertexUiElement> topologyVertices(Ref ref, Id<Trip> tripId) {
  final vertices = ref.watch(collectionProvider<Vertex>(tripId));

  final waypoints = ref.watch(collectionProvider<Waypoint>(tripId));

  final waypointByVertexId = {
    for (final wp in waypoints.values) wp.vertexId: wp,
  };

  return vertices.values.map((vertex) {
    final waypoint = waypointByVertexId[vertex.id];

    if (waypoint != null) {
      return WaypointUiElement(tripId, vertex, waypoint);
    }

    return VertexUiElement(tripId, vertex);
  }).toList();
}
