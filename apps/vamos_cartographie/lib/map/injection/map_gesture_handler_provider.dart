import 'package:map_engine/application/map_gesture_handler.dart';
import 'package:map_engine/domain/map_objects/map_objects.dart';
import 'package:map_engine/domain/offset_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/injection/map_context_provider.dart';
part 'map_gesture_handler_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapController, mapScene, mapCamera])
MapGestureHandler mapGestureHandler(Ref ref) {
  final handler = MapGestureHandler(
    hitTest: ({required WorldOffset offset, MapObject? exclude}) {
      final scene = ref.read(mapSceneProvider);
      final camera = ref.watch(mapCameraProvider);
      return scene.hitTest(
        offset,
        camera.zoomScale,
        ignore: (o) => exclude != null && o.isSameAs(exclude),
      );
    },
    onGesture: ref.watch(mapControllerProvider).dispatchGesture,
  );

  ref.onDispose(handler.dispose);

  return handler;
}
