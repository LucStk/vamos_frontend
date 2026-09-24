import 'package:map_canvas/domain/map_scene.dart';
import 'package:map_engine/application/application.dart';
import 'package:map_engine/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/engine/camera/camera.dart';

part 'map_hit_test_provider.g.dart';

@Riverpod(keepAlive: true)
HitTest mapHitTest(Ref ref, ProviderListenable<MapScene> sceneProvider) {
  final scene = ref.watch(sceneProvider);
  final scale = ref.watch(mapCameraHolderProvider).zoomScale;

  return ({required WorldOffset offset, MapObject? exclude}) {
    return scene.hitTest(
      offset,
      scale,
      ignore: (o) => exclude != null && o.isSameAs(exclude),
    );
  };
}
