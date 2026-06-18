import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/map_ui_element.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

final topologyVerticesProvider = Provider.family<List<VertexUiModel>, Id<Trip>>(
  (ref, tripId) {
    final vertices = ref.watch(collectionProvider<Vertex>(tripId));

    final waypoints = ref.watch(collectionProvider<Waypoint>(tripId));

    final waypointByVertexId = {
      for (final wp in waypoints.values) wp.vertexId: wp,
    };

    return vertices.values.map((vertex) {
      final waypoint = waypointByVertexId[vertex.id];

      if (waypoint != null) {
        return WaypointVertexUiModel(vertex, waypoint);
      }

      return PureVertexUiModel(vertex);
    }).toList();
  },
);
