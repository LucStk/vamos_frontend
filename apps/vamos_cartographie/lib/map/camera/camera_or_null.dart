// camera_ready.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/camera/flutter_map_camera.dart';

part 'camera_or_null.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapCamera])
FlutterMapCamera? cameraOrNull(Ref ref) {
  final camera = ref.watch(mapCameraProvider);

  void onChange() => ref.invalidateSelf();
  camera.ready.addListener(onChange);
  ref.onDispose(() => camera.ready.removeListener(onChange));
  print("camera rebuila");

  return camera.ready.value ? camera : null;
}
