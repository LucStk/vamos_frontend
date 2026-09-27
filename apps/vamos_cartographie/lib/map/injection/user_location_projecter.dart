import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/map.dart';
import '/app_services/app_services.dart';
part "user_location_projecter.g.dart";

@Riverpod(keepAlive: true, dependencies: [CameraOrNull])
List<ProjectedPoint> userLocationProjection(Ref ref) {
  final location = ref.watch(userLocationProvider);
  final cameraReader = ref.read(cameraOrNullProvider);
  if (cameraReader == null) {
    return [];
  }

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
