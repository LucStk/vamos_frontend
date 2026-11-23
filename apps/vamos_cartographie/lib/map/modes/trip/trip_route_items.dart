import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/map/objects/route/day_segment/providers/day_segment_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

/// La route en trait, par journées dès qu'une halte en sépare au moins deux,
/// sinon par sections de mobilité (les journées n'existent pas).
///
/// Partagée par la lecture du trip et par la sélection d'une portion : le
/// glissement qui ouvre la seconde part d'un segment de jour, qui doit donc
/// exister dans sa scène pour que le geste continue.
List<SceneItem> tripRouteItems(Ref ref, TripId tripId, MapCameraReader cam) {
  final days = ref.watch(routeDaysProvider(tripId));
  if (days.length < 2) return ref.watch(allSegmentItemProvider(tripId, cam));
  return [
    for (final d in days)
      ?ref.watch(daySegmentItemProvider(tripId, d.endsAt, cam)),
  ];
}
