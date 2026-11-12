import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/mobility_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/geometry/polyline_midpoint.dart';
import 'package:vamos_cartographie/map/objects/route/segment/mobility_badge_item.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/segment_item_provider.dart';

part 'mobility_badge_item_provider.g.dart';

/// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.
@Riverpod(keepAlive: true)
MobilityBadgeItem? mobilityBadgeItem(
  Ref ref,
  TripId tripId,
  MobilitySpanId id,
  MapCameraReader cameraReader,
) {
  final geometry = ref.watch(
    segmentItemProvider(
      tripId,
      id,
      cameraReader,
    ).select((m) => m?.worldSegments),
  );

  final mobilityType = ref.watch(
    mobilitySpanProvider(tripId, id).select((m) => m.mobilityType),
  );

  if (geometry == null) return null;
  final midPoint = polylineMidpoint(geometry);
  if (midPoint == null) return null;

  return MobilityBadgeItem(
    glyph: MobilityAppearances.glyphOf(mobilityType),
    appearance: MobilityAppearances.of(mobilityType),
    worldPosition: midPoint.position,
    object: MobilityBadge(sectionId: id, mobility: mobilityType),
  );
}
