import "package:map_application/map_application.dart";
import "package:map_canvas/map_canvas.dart";
import "package:map_engine/map_engine.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:vamos_cartographie/map/engine/injection/map_hit_test_provider.dart";

part 'gesture_handler_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapHitTest])
MapGestureHandler mapGestureHandler(
  Ref ref,
  ProviderListenable<MapScene> scene,
  ProviderListenable<BaseController> controller,
) {
  final hitTest = ref.watch(mapHitTestProvider(scene));

  return MapGestureHandler(
    hitTest: hitTest,
    onGesture: ref.read(controller).dispatchGesture,
  );
}
