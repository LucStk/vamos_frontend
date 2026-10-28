// map/ui/shared/menus/menu_placement.dart
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
import 'package:vamos_cartographie/map/modes/edit_trip/providers/trip_end_item_provider.dart';
import 'package:vamos_cartographie/map/modes/edit_trip/providers/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/providers/pencil_item_provider.dart';
part 'menu_placement.g.dart';

typedef MenuPlacement = ({
  ContextMenuOverlay<AppMode> overlay,
  WorldOffset world,
});

@Riverpod(keepAlive: true, dependencies: [modeOverlay, pencilItem])
MenuPlacement? menuPlacement(Ref ref) {
  final camera = ref.watch(readyCameraProvider);
  if (camera == null) return null;
  final overlay = ref.watch(modeOverlayProvider);
  if (overlay is! ContextMenuOverlay<AppMode>) return null; // promu ici

  final WorldOffset? world = switch (overlay.anchor) {
    VertexAnchor(:final object) =>
      ref
          .watch(waypointItemProvider(object.tripId, object.id, camera))
          .worldPosition,
    PencilAnchor() => ref.watch(pencilItemProvider(camera))?.worldPosition,
    TripOriginAnchor t => switch (t.object) {
      MapTmpOrigin _ => ref.watch(tmpOriginItemProvider(camera))?.worldPosition,
      MapTripOrigin m =>
        ref.watch(tripOriginItemProvider(m.tripId, camera))?.worldPosition,
    },
    TripEndAnchor(:final object) =>
      ref.watch(tripEndItemProvider(object.tripId, camera))?.worldPosition,
    GeoAnchor(:final position) => position,
    SectionAnchor(:final position) => position,
  };
  if (world == null) return null;

  return (overlay: overlay, world: world);
}
