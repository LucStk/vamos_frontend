// scene_composition.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/segment/providers/segments_layer.dart';
import 'package:vamos_cartographie/map/objects/trip_end/providers/trip_end_item_provider.dart';
import 'package:vamos_cartographie/map/objects/trip_origin/providers/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

List<Layer> tripEditScene(TripId tripId) => [
  (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
  (ref, cam) => ref.watch(allWaypointItemProvider(tripId, cam)),
  (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
];
