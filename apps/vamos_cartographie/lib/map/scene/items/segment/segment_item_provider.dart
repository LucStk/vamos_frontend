import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/section_queries.dart';
import 'package:vamos_cartographie/map/scene/items/segment/segment_item.dart';

part 'segment_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
SegmentItem? segmentItem(
  Ref ref,
  TripId tripId,
  SectionId id,
  MapCameraReader cameraReader,
) {
  // select : ce segment ne se reconstruit que si SA plage change.
  final range = ref.watch(sectionRangesProvider(tripId).select((m) => m[id]));
  final geometry = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
  );
  if (range == null || geometry == null) return null;

  final points = geometry;
  final first = range.first.clamp(0, points.length - 1);
  final last = range.last.clamp(0, points.length - 1);
  if (last <= first) return null; // section dégénérée : rien à tracer

  final slice = points.sublist(first, last + 1);

  return SegmentItem(
    worldSegments: projectLine(slice, cameraReader.latLngToWorldOffset),
    object: MapSegment(tripId: tripId, id: id),
  );
}

@Riverpod(keepAlive: true, dependencies: [segmentItem])
List<LineItem> allSegmentItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final sections = ref.watch(allSectionsProvider(tripId));
  return [
    for (final section in sections)
      ?ref.watch(segmentItemProvider(tripId, section.id, camera)),
  ];
}
