import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/scene/items/segment/segment_item.dart';
import 'package:vamos_cartographie/map/scene/layers/edit_trip/segments/section_slice.dart';

part 'segment_item_provider.g.dart';

/// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.
@Riverpod(keepAlive: true, dependencies: [])
SegmentItem? segmentItem(
  Ref ref,
  TripId tripId,
  SectionId id,
  MapCameraReader cameraReader,
) {
  final range = ref.watch(sectionRangesProvider(tripId).select((m) => m[id]));
  final geometry = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
  );
  if (range == null || geometry == null) return null;

  final slice = sliceBetween(geometry, range.first, range.last);
  if (slice == null) return null;

  return SegmentItem(
    worldSegments: projectLine(slice, cameraReader.latLngToWorldOffset),
    object: MapSection(tripId: tripId, id: id),
  );
}
