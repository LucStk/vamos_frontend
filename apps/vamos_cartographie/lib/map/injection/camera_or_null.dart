// camera_ready.dart
import 'package:map_engine/domain/map_camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_or_null.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class CameraOrNull extends _$CameraOrNull {
  @override
  MapCameraController? build() => null; // pas prête au départ

  void markReady(MapCameraController camera) => state = camera;
}
