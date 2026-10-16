// map/ui/shared/menus/menu_placement.dart
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/camera_or_null.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/sketch_item_provider.dart';
import 'package:vamos_cartographie/map/scene/items/vertex/vertex_item_provider.dart';

part 'menu_placement.g.dart';

typedef MenuPlacement = ({
  ContextMenuOverlay overlay,
  MapCameraController camera,
  WorldOffset world,
});

@Riverpod(
  keepAlive: true,
  dependencies: [modeOverlay, CameraOrNull, vertexItem, pencilItem],
)
MenuPlacement? menuPlacement(Ref ref) {
  final overlay = ref.watch(modeOverlayProvider);
  if (overlay is! ContextMenuOverlay) return null;

  final camera = ref.watch(cameraOrNullProvider);
  if (camera == null) return null;

  final world = switch ((overlay as ContextMenuOverlay).anchor) {
    VertexAnchor(:final object) =>
      ref
          .watch(vertexItemProvider(object.tripId, object.id, camera))
          .worldPosition,
    PencilAnchor() => ref.watch(pencilItemProvider(camera))?.worldPosition,
    GeoAnchor(:final position) => camera.(position),
  };
  if (world == null) return null;

  return (overlay: overlay, camera: camera, world: world);
}
