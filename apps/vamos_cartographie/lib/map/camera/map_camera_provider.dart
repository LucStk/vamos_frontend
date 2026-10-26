import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/flutter_map_camera.dart';
part 'map_camera_provider.g.dart';

@Riverpod(
  keepAlive: true,
) // plus de dependencies: [] : le provider n'est plus scopé
FlutterMapCamera mapCamera(Ref ref) {
  final camera = FlutterMapCamera(MapController());
  ref.onDispose(camera.dispose);
  return camera;
}

/// La caméra une fois la carte montée, sinon `null`.
/// Pont entre `camera.ready` (ValueNotifier) et Riverpod.
@Riverpod(keepAlive: true)
FlutterMapCamera? readyCamera(Ref ref) {
  final camera = ref.watch(mapCameraProvider);

  void onChange() => ref.invalidateSelf();
  camera.ready.addListener(onChange);
  ref.onDispose(() => camera.ready.removeListener(onChange));

  return camera.ready.value ? camera : null;
}
