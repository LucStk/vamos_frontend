import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import '../../../../domain_features/domain_features.dart';
import '../../../canvas/domain/scene_item/trip/trip_item.dart';
part 'trip_item.g.dart';

@Riverpod(dependencies: [])
TripItem tripItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final tripSegment = ref.watch(allSegmentsProvider(tripId));
  final tripGeometry = tripSegment.map((s) => s.geometry).toList();
  return TripItem(
    worldSegments: projectPolyline(tripGeometry, camera.latLngToWorldOffset),
    object: MapTrip(tripId),
  );
}
