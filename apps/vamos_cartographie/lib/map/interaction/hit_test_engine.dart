import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/scene/map_scene.dart';

part 'hit_test_engine.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapScene])
HitTester hitTester(Ref ref) => _SceneHitTester(ref);

@Dependencies([mapScene])
class _SceneHitTester implements HitTester {
  _SceneHitTester(this._ref);
  final Ref _ref;

  @override
  MapHit? hitTest({
    required ScreenOffset offset,
    MapObject? exclude,
    bool dropTargetsOnly = false,
  }) {
    final scene = _ref.read(mapSceneProvider);
    final camera = _ref.read(mapCameraProvider);
    return scene.hitTest(
      camera.screenToWorld(offset),
      camera.zoomScale,
      ignore: (o) => o == exclude || (dropTargetsOnly && !o.isDropTarget),
    );
  }
}
