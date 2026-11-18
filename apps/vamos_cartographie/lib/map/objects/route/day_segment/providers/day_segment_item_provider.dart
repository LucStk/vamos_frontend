import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/modes/shared/helpers/section_slice.dart';
import 'package:vamos_cartographie/map/objects/route/day_segment/day_segment_item.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/mobility_appearance.dart';
// + vos imports habituels : route_store, route_polyline_provider,
//   mobilitySpanProvider, MobilityAppearances, sliceBetween, projectLine...

part 'day_segment_item_provider.g.dart';

@Riverpod(keepAlive: true)
DaySegmentItem? daySegmentItem(
  Ref ref,
  TripId tripId,
  WaypointId? endsAt,
  MapCameraReader cameraReader,
) {
  final dayRuns = ref.watch(dayRunsProvider(tripId, endsAt));
  final geometry = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
  );
  final polyline = ref.watch(routePolylineProvider(tripId, cameraReader));
  if (dayRuns == null || geometry == null || polyline == null) return null;

  final runs = <DayRunGeometry>[];
  for (final run in dayRuns.runs) {
    // Les bornes d'un jour sont fractionnaires (anchorPosition d'une halte) :
    // il faut un découpage à positions décimales, qui interpole un point sur
    // le segment où tombe la borne. Le `sliceBetween(geometry, int, int)` ne
    // convient pas ; adaptez à l'équivalent LatLng de `polyline.sliceBetween`
    // (voir la remarque dans la réponse).
    final slice = sliceBetweenPositions(geometry, run.range.from, run.range.to);
    if (slice == null) continue;

    // Adaptez : MobilitySpanId et SpanId sont peut-être deux types distincts.
    final mobilityType = ref.watch(
      mobilitySpanProvider(
        tripId,
        MobilitySpanId(run.mobilityId.value),
      ).select((m) => m.mobilityType),
    );
    runs.add((
      appearance: MobilityAppearances.of(mobilityType),
      worldSegments: projectLine(slice, cameraReader.latLngToWorldOffset),
    ));
  }
  if (runs.isEmpty) return null;

  return DaySegmentItem(
    object: MapDaySegment(tripId: tripId, endsAt: endsAt),
    runs: runs,
    polyline: polyline,
  );
}
