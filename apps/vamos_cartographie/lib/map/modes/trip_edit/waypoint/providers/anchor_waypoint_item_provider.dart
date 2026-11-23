import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/injection.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/waypoint/anchor_waypoint_item.dart';
import 'package:vamos_cartographie/map/objects/waypoint/chain_waypoint_item.dart';

part 'anchor_waypoint_item_provider.g.dart';

@Riverpod(keepAlive: true)
List<SceneItem> anchorWaypointItem(
  Ref ref,
  TripId tripId,
  WaypointId waypointId,
  MapCameraReader camera,
) {
  final waypoint = ref.watch(waypointProvider(tripId, waypointId));
  final polyline = ref.watch(routePolylineProvider(tripId, camera));
  if (polyline == null) return [];
  final anchorPos = polyline.pointAt(waypoint.anchorPosition);
  final waypointPos = camera.latLngToWorldOffset(waypoint.position);

  return [
    AnchorWaypointItem(
      polyline: polyline,
      object: MapWaypointAnchor(tripId: tripId, waypointId: waypointId),
      worldPosition: anchorPos,
    ),
    ChainWaypointItem(
      object: MapChainWaypoint(tripId: tripId, waypointId: waypointId),
      worldSegments: [(waypointPos, anchorPos)],
    ),
  ];
}

@Riverpod(keepAlive: true)
List<SceneItem> allWaypointAnchorItem(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  return [
    for (final id in ref.watch(allWaypointIdsProvider(tripId)))
      ...ref.watch(anchorWaypointItemProvider(tripId, id, camera)),
  ];
}

/// Couche des ancres en édition : on ne voit que celles des étapes (haltes de
/// nuit) et celle du waypoint sélectionné, pour ne pas surcharger la carte.
///
/// Fonction simple et non provider : elle suit la sélection et les haltes
/// elle-même, et réutilise les items de [anchorWaypointItemProvider].
List<SceneItem> visibleWaypointAnchors(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  final selected = ref.watch(modeSelectionProvider);
  final selectedId = selected is MapWaypoint && selected.tripId == tripId
      ? selected.id
      : null;

  return [
    for (final id in ref.watch(allWaypointIdsProvider(tripId)))
      if (id == selectedId ||
          ref.watch(waypointProvider(tripId, id).select((w) => w.stay != null)))
        ...ref.watch(anchorWaypointItemProvider(tripId, id, camera)),
  ];
}
