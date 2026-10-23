// map/ui/shared/menus/menu_placement.dart
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/camera_or_null.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/waypoint/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/layers/edit_trip/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/scene/layers/edit_trip/sketch/pencil_item_provider.dart';

part 'menu_placement.g.dart';

typedef MenuPlacement = ({
  ContextMenuOverlay<AppMode> overlay,
  WorldOffset world,
});

@Riverpod(
  keepAlive: true,
  dependencies: [cameraOrNull, modeOverlay, pencilItem, tripOriginItem],
)
MenuPlacement? menuPlacement(Ref ref) {
  final camera = ref.watch(cameraOrNullProvider);
  if (camera == null) return null;
  final overlay = ref.watch(modeOverlayProvider);
  if (overlay is! ContextMenuOverlay<AppMode>) return null; // promu ici

  final WorldOffset? world = switch (overlay.anchor) {
    VertexAnchor(:final object) =>
      ref
          .watch(waypointItemProvider(object.tripId, object.id, camera))
          .worldPosition,
    PencilAnchor() => ref.watch(pencilItemProvider(camera))?.worldPosition,
    TripOriginAnchor() =>
      ref.watch(tripOriginItemProvider(camera))?.worldPosition,
    GeoAnchor(:final position) => position,
  };
  if (world == null) return null;

  return (overlay: overlay, world: world);
}
