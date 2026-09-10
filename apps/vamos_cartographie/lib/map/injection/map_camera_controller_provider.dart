import 'package:map_application/map_camera_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';

part 'map_camera_controller_provider.g.dart';

@Riverpod(keepAlive: true)
MapCameraController mapCameraController(Ref ref) {
  throw UnimplementedError(
    'mapCameraControllerProvider doit être surchargé dans le Widget Tree avec ProviderScope',
  );
}

@Riverpod(keepAlive: true)
class CameraRevision extends _$CameraRevision {
  @override
  int build(TripId tripId) {
    final camera = ref.read(mapCameraControllerProvider);

    final subscription = camera.cameraStream.listen((_) {
      state++;
    });

    ref.onDispose(subscription.cancel);

    return 0;
  }
}
