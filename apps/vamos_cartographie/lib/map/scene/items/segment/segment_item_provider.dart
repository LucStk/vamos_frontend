import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/topology/injection/queries/queries.dart';
import 'package:vamos_cartographie/map/scene/items/segment/segment_item.dart';

part 'segment_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
SegmentItem segmentItem(
  Ref ref,
  TripId tripId,
  SectionId id,
  MapCameraReader cameraReader,
) {
  final d = ref.watch(segmentProvider(tripId, id));
  return SegmentItem(
    worldSegments: projectLine(d.geometry, cameraReader.latLngToWorldOffset),
    object: MapSegment(tripId: tripId, id: d.id),
  );
}

@Riverpod(keepAlive: true, dependencies: [segmentItem])
List<LineItem> allSegmentItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final segments = ref.watch(allSegmentsProvider(tripId));
  return [
    for (final segment in segments)
      ref.watch(segmentItemProvider(tripId, segment.id, camera)),
  ];
}
