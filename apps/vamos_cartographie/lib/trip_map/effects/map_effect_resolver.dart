import 'package:vamos_cartographie/trip_map/effects/map_effects.dart';
import 'package:vamos_cartographie/trip_map/trip_map.dart';

class MapEffectResolver {
  static Future<TripMapState?> resolve(
    MapEffectImpl effect,
    MapEffectContext context,
  ) {
    return switch (effect) {
      ZoomToEffect e => e.resolve(context),
      CreateSegmentFromSketchEffect e => e.resolve(context),
      SpliceSegmentEffect e => e.resolve(context),
      EditSegmentFromSketchEffect e => e.resolve(context),
      ChangeSegmentSelectedTypeEffect e => e.resolve(context),
      CorrectSegmentFromSketchEffect e => e.resolve(context),
      DeleteSegmentEffect e => e.resolve(context),
      CreateSimpleVertexEffect e => e.resolve(context),
      UpdateRemoteVertexPositionEffect e => e.resolve(context),
      CreateWaypointFromVertexEffect e => e.resolve(context),
      CreateWaypointFromPositionEffect e => e.resolve(context),
      RemoveVertexEffect e => e.resolve(context),
      DeleteSelectedVertexEffect e => e.resolve(context),
    };
  }
}
