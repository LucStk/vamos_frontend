import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/modes/shared/helpers/section_slice.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/mobility_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/segment_item.dart';

part 'segment_item_provider.g.dart';

@Riverpod(keepAlive: true)
SegmentItem? segmentItem(
  Ref ref,
  TripId tripId,
  MobilitySpanId id,
  MapCameraReader cameraReader,
) {
  final mobilityType = ref.watch(
    mobilitySpanProvider(tripId, id).select((m) => m.mobilityType),
  );

  // Seuls les sommets servent ici : sélectionner `.vertices` (un record, donc
  // comparé par valeur) évite de reconstruire le segment si seule la nature
  // d'une borne change.
  final range = ref.watch(
    mobilitySpanExtentsProvider(tripId).select((m) => m[id]?.vertices),
  );

  final geometry = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
  );
  final polyline = ref.watch(routePolylineProvider(tripId, cameraReader));
  if (range == null || geometry == null || polyline == null) return null;

  final slice = sliceBetween(geometry, range.first, range.last);
  if (slice == null) return null;

  return SegmentItem(
    polyline: polyline,
    appearance: MobilityAppearances.of(mobilityType),
    worldSegments: projectLine(slice, cameraReader.latLngToWorldOffset),
    object: MapMobilitySpan(tripId: tripId, id: id),
  );
}
