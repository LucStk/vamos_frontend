import 'package:domain_core/domain_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/modes/shared/helpers/section_slice.dart';
import 'package:vamos_cartographie/map/objects/route/day_segment/day_segment_item.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/mobility_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/segment_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/geometry/rounded_polyline.dart';
import 'package:vamos_cartographie/map/objects/route/segment/style/segment_style.dart';
// + vos imports habituels : route_store, route_polyline_provider,
//   mobilitySpanProvider, MobilityAppearances, sliceBetween, projectLine...

part 'day_segment_item_provider.g.dart';

@Riverpod(keepAlive: true)
DaySegmentItem? daySegmentItem(
  Ref ref,
  TripId tripId,
  SpanId dayId,
  MapCameraReader cameraReader,
) {
  final dayRuns = ref.watch(dayRunsProvider(tripId, dayId));
  final geometry = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
  );
  final polyline = ref.watch(routePolylineProvider(tripId, cameraReader));
  if (dayRuns == null || geometry == null || polyline == null) return null;

  final runs = <DayRunGeometry>[];
  for (final run in dayRuns.runs) {
    // sliceBetween inclut les deux sommets : deux tronçons voisins partagent
    // leur sommet de jonction, le tracé reste continu.
    final slice = sliceBetween(geometry, run.range.first, run.range.last);
    if (slice == null) continue;

    // Adaptez : MobilitySpanId et SpanId sont peut-être deux types distincts.
    final mobilityType = ref.watch(
      mobilitySpanProvider(
        tripId,
        run.mobilityId,
      ).select((m) => m.mobilityType),
    );
    runs.add((
      appearance: MobilityAppearances.of(mobilityType),
      worldSegments: projectLine(slice, cameraReader.latLngToWorldOffset),
    ));
  }
  if (runs.isEmpty) return null;

  return DaySegmentItem(
    object: MapDaySegment(tripId: tripId, id: dayId),
    runs: runs,
    polyline: polyline,
  );
}
