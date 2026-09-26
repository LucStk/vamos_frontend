// camera_ready.dart
import 'package:map_engine/domain/map_camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/map.dart';

part 'camera_or_null.g.dart';

@Riverpod(dependencies: [])
class CameraOrNull extends _$CameraOrNull {
  @override
  MapCameraController? build() => null; // pas prête au départ

  void markReady(MapCameraController camera) => state = camera;
}
