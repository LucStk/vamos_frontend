// // map/ui/shared/menus/menu_placement.dart
// import 'package:domain_core/domain_core.dart';
// import 'package:map_engine/map_engine.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
// import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
// import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_end_item_provider.dart';
// import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_origin_item_provider.dart';
// import 'package:vamos_cartographie/map/modes/shared/providers/items/waypoint_item_provider.dart';
// import 'package:vamos_cartographie/map/modes/sketch_mode/providers/pencil_item_provider.dart';
// part 'menu_placement.g.dart';
//
// typedef MenuPlacement = ({
//   ContextMenuOverlay overlay,
//   WorldOffset world,
// });
//
// @Riverpod(keepAlive: true, dependencies: [modeOverlay, pencilItem])
// MenuPlacement? menuPlacement(Ref ref) {
//   final camera = ref.watch(readyCameraProvider);
//   if (camera == null) return null;
//   final overlay = ref.watch(modeOverlayProvider);
//   if (overlay is! ContextMenuOverlay) return null; // promu ici
//
//   final WorldOffset? world = switch (overlay.anchor) {
//     VertexMapAnchor(:final object) =>
//       ref
//           .watch(waypointItemProvider(object.tripId, object.id, camera))
//           .worldPosition,
//     PencilMapAnchor() => ref.watch(pencilItemProvider(camera))?.worldPosition,
//     TripOriginMapAnchor t => switch (t.object) {
//       MapTmpOrigin _ => ref.watch(tmpOriginItemProvider(camera))?.worldPosition,
//       MapTripOrigin m =>
//         ref.watch(tripOriginItemProvider(m.tripId, camera))?.worldPosition,
//     },
//     TripEndMapAnchor(:final object) =>
//       ref.watch(tripEndItemProvider(object.tripId, camera))?.worldPosition,
//     GeoMapAnchor(:final position) => position,
//     SectionMapAnchor(:final position) => position,
//   };
//   if (world == null) return null;
//
//   return (overlay: overlay, world: world);
// }
