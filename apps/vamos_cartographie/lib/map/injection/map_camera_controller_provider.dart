import 'package:map_application/map_camera_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_camera_controller_provider.g.dart';

@Riverpod(keepAlive: true)
MapCameraController mapCameraController(Ref ref) {
  throw UnimplementedError(
    'mapCameraControllerProvider doit être surchargé dans le Widget Tree avec ProviderScope',
  );
}
