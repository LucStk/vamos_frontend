import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/base_map/injection/injection.dart';
import 'package:vamos_cartographie/user_location/user_location.dart';
import 'package:map_engine/map_engine.dart';
part "user_location_projecter.g.dart";

@riverpod
List<ProjectedPoint> userLocationProjection(Ref ref) {
  final location = ref.watch(userLocationProvider);
  final cameraReader = ref.read(mapCameraHolderProvider);

  if (location case final UserPositionActive activeLocation) {
    return [
      ProjectedUserLocation(
        object: MapUserLocation(
          activeLocation.position,
          accuracy: activeLocation.accuracy,
          heading: activeLocation.heading,
        ),
        worldPosition: cameraReader.latLngToWorldOffset(
          activeLocation.position,
        ),
      ),
    ];
  }
  return [];
}
