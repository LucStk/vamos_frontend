// map/modes/route_edit/sketch/sketch_view.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ui.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';
import 'package:vamos_cartographie/map/objects/route/day_segment/providers/day_segment_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';

ModeView tripReadyView(TripReadyMode m) => ModeView(
  scene: SceneSpec(
    layers: [
      (ref, cam) => [?ref.watch(tripEndItemProvider(m.tripId, cam))],
      (ref, cam) => [?ref.watch(tripOriginItemProvider(m.tripId, cam))],
      (ref, cam) => ref.watch(allMobilityBadgeItemProvider(m.tripId, cam)),
      (ref, cam) => ref.watch(allWaypointItemProvider(m.tripId, cam)),
      (ref, cam) => _routeItems(ref, m.tripId, cam),
    ],
  ),
  ui: () => TripReadyUi(m),
);

/// La route en trait, par journées dès qu'une halte en sépare au moins deux,
/// sinon par sections de mobilité (les journées n'existent pas).
List<SceneItem> _routeItems(Ref ref, TripId tripId, MapCameraReader cam) {
  final days = ref.watch(routeDaysProvider(tripId));
  if (days.length < 2) return ref.watch(allSegmentItemProvider(tripId, cam));
  return [
    for (final d in days)
      ?ref.watch(daySegmentItemProvider(tripId, d.endsAt, cam)),
  ];
}
