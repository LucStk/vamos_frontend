import 'package:map_engine/controller/controller.dart';
import 'package:map_engine/visual/visual.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/base_map/injection/injection.dart';

part 'map_hit_test_provider.g.dart';

@Riverpod(keepAlive: true)
HitTest mapHitTest(Ref ref, ProviderListenable<MapScene> sceneProvider) {
  final scene = ref.watch(sceneProvider);
  final scale = ref.watch(mapCameraHolderProvider).zoomScale;

  return ({required WorldOffset offset, MapObject? exclude}) {
    return scene.projectedScene.hitTest(
      offset,
      scale,
      ignore: (o) => exclude != null && o.isSameAs(exclude),
    );
  };
}
