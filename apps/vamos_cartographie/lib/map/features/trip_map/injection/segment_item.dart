import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import '../../../../domain_features/topology/injection/queries/queries.dart';
import '../../../canvas/domain/scene_item/segment/segment_item.dart';

part 'segment_item.g.dart';

@Riverpod(dependencies: [])
SegmentItem segmentItem(
  Ref ref,
  TripId tripId,
  SegmentId id,
  MapCameraReader cameraReader,
) {
  final d = ref.watch(segmentProvider(tripId, id));
  return SegmentItem(
    worldSegments: projectLine(d.geometry, cameraReader.latLngToWorldOffset),
    object: MapSegment(d.id, d.geometry),
  );
}
