import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/scene/items/waypoint/vertex_item_provider.dart';

@Dependencies([vertexItem])
ScreenOffset? vertexScreenPosition(
  WidgetRef ref,
  MapCameraController camera,
  MapWaypoint object,
) {
  final waypoint = ref.read(
    vertexItemProvider(object.tripId, object.id, camera),
  );

  final worldPosition = waypoint.worldPosition;
  return camera.worldToScreen(worldPosition);
}
