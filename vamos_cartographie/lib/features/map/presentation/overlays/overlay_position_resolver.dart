import 'package:flutter/animation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/waypoint_queries.dart';
import 'package:vamos_cartographie/features/map/interaction/overlay/anchor.dart';

class OverlayPositionResolver {
  static Offset resolve(
    OverlayAnchor anchor,
    WidgetRef ref,
    Id<Trip> tripId,
    MapController mapController,
  ) {
    switch (anchor) {
      case CursorAnchor c:
        return mapController.camera.latLngToScreenOffset(c.latLng);

      case VertexAnchor v:
        final vertex = ref.read(nodeRequiredProvider<Vertex>(tripId, v.id));
        return mapController.camera.latLngToScreenOffset(vertex.latLng);

      case WaypointAnchor w:
        final vertex = ref.read(waypointVertexProvider(tripId, w.id));
        return mapController.camera.latLngToScreenOffset(vertex.latLng);
      case _:
        throw (Exception("Anchor $anchor position impossible de calculate"));
    }
  }
}
