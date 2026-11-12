import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/waypoint/pending_waypoint_item.dart';

part 'pending_waypoint_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
List<SceneItem> pendingWaypoint(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  final pending = ref.watch(modeSlotProvider(pendingWaypointSlot));
  if (pending == null) return const [];

  return [
    PendingWaypointItem(
      object: MapPendingWaypoint(tripId: tripId),
      worldPosition: pending.point,
    ),
  ];
}
