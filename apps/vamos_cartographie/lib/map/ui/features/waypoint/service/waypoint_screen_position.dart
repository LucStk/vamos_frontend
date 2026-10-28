import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/waypoint_item_provider.dart';

// import 'package:riverpod_annotation/experimental/scope.dart';
// @Dependencies([waypointItem])
ScreenOffset? waypointScreenPosition(
  WidgetRef ref,
  MapCameraController camera,
  MapWaypoint object,
) {
  final waypoint = ref.read(
    waypointItemProvider(object.tripId, object.id, camera),
  );

  final worldPosition = waypoint.worldPosition;
  return camera.worldToScreen(worldPosition);
}
