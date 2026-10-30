// map/modes/sketch_mode/providers/sketch_endpoint_items_provider.dart
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_end_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/scene/trip_end_item.dart';
import 'package:vamos_cartographie/map/modes/shared/scene/trip_origin_item.dart';

part 'sketch_endpoint_items_provider.g.dart';

/// Vrai tant que le tracé en cours, parti de l'extrémité de type [T], n'a
/// aucun point hors du rayon de [item].
///
/// Dérivé des points du tracé, donc sans état à garder : dès qu'un point est
/// sorti du rayon, c'est faux, et le reste même si le crayon revient (boucle).
/// `every` s'arrête au premier point hors rayon ; sans point, c'est vrai :
/// l'icône est cachée dès la saisie, le crayon prend sa place.
bool _pencilStillOn<T extends RouteElements>(
  SketchTrace? trace,
  SceneItem item,
  double zoomScale,
) =>
    trace != null &&
    trace.startAnchor.object is T &&
    trace.points.every((p) => item.isHitAt(p, zoomScale));

/// Icône de départ de la route, absente tant que le crayon parti d'elle ne
/// l'a pas quittée.
@Riverpod(keepAlive: true, dependencies: [modeSlot])
TripOriginItem? sketchOriginItem(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  final item = ref.watch(tripOriginItemProvider(tripId, camera));
  if (item == null) return null;

  final zoom = camera.zoomScale;
  // On sélectionne un bool : le provider ne se recalcule qu'à la bascule,
  // pas à chaque point dessiné.
  final hidden = ref.watch(
    modeSlotProvider(
      sketchTraceSlot,
    ).select((m) => _pencilStillOn<MapTripOrigin>(m, item, zoom)),
  );
  return hidden ? null : item;
}

/// Icône d'arrivée de la route, même règle.
@Riverpod(keepAlive: true, dependencies: [modeSlot])
TripEndItem? sketchEndItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final item = ref.watch(tripEndItemProvider(tripId, camera));
  if (item == null) return null;

  final zoom = camera.zoomScale;
  final hidden = ref.watch(
    modeSlotProvider(
      sketchTraceSlot,
    ).select((m) => _pencilStillOn<MapTripEnd>(m, item, zoom)),
  );
  return hidden ? null : item;
}
