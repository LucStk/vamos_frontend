import 'package:flutter_map/flutter_map.dart';
import 'package:map_application/map_camera_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/map_input/flutter_map_camera_reader.dart';

part 'map_camera_provider.g.dart';

// map_camera_controller_provider.dart
@Riverpod(keepAlive: true)
MapController mapController(Ref ref) {
  final controller = MapController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
MapCameraReader mapCameraReader(Ref ref) {
  ref.watch(mapCameraChangesProvider);
  final controller = ref.watch(mapControllerProvider);
  return FlutterMapCameraReader(
    controller,
  ); // implémentation basée sur MapController seul
}

@riverpod
class MapCameraChanges extends _$MapCameraChanges {
  @override
  int build() {
    final controller = ref.watch(mapControllerProvider);

    final subscription = controller.mapEventStream.listen((_) {
      state++;
    });

    ref.onDispose(subscription.cancel);

    return 0;
  }
}

@Riverpod(keepAlive: true)
class MapCameraControllerHolder extends _$MapCameraControllerHolder {
  @override
  MapCameraController? build() => null;

  void set(MapCameraController controller) => state = controller;
}

// Le provider dérivé reste utilisable tel quel par le reste du code,
// mais expose maintenant explicitement le cas "pas encore prêt"
@riverpod
MapCameraController? mapCameraControllerOrNull(Ref ref) {
  return ref.watch(mapCameraControllerHolderProvider);
}
