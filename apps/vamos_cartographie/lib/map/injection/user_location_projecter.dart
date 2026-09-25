import 'package:map_canvas/application/projection/projected_user_location.dart';
import 'package:map_canvas/domain/projected_base_object/projected_object.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/injection/map_context_provider.dart';
import '/app_services/app_services.dart';
part "user_location_projecter.g.dart";

@Riverpod(keepAlive: true, dependencies: [mapCamera])
List<ProjectedPoint> userLocationProjection(Ref ref) {
  final location = ref.watch(userLocationProvider);
  final cameraReader = ref.read(mapCameraProvider);

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
