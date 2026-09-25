import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:map_engine/application/map_gesture_handler.dart';
import 'package:map_engine/domain/map_objects/map_objects.dart';
import 'package:map_engine/domain/offset_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/engine/injection/injection.dart';
part 'map_gesture_handler_provider.g.dart';

@Riverpod(dependencies: [mapContext])
MapGestureHandler mapGestureHandler(
  Ref ref,
  BaseController<BaseMode> controller,
) {
  final handler = MapGestureHandler(
    hitTest: ({required WorldOffset offset, MapObject? exclude}) {
      final scene = ref.read(mapContextProvider).scene;
      final camera = ref.watch(mapContextProvider.select((s) => s.camera));
      return scene.hitTest(
        offset,
        camera.zoomScale,
        ignore: (o) => exclude != null && o.isSameAs(exclude),
      );
    },
    onGesture: controller.dispatchGesture,
  );

  ref.onDispose(handler.dispose);

  return handler;
}
