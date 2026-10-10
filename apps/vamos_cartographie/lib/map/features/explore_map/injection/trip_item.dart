import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import '../../../canvas/domain/scene_item/trip/trip_item.dart';
import 'map_trip_object.dart';
part 'trip_item.g.dart';

@Riverpod(dependencies: [])
TripItem tripItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final tripObject = ref.watch(mapTripObjectProvider(tripId));
  return TripItem(
    worldSegments: projectPolyline(
      tripObject.lines,
      camera.latLngToWorldOffset,
    ),
    object: tripObject,
  );
}
