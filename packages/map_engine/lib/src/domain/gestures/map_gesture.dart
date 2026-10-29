// domain/gestures/map_gesture.dart
import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/input/map_pointer_event.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';

/// Geste sémantique sur la carte. Valeur pure, produite par `input/`
/// et consommée par la machine à modes.
///
/// Exemples de filtrage (exhaustif grâce à `sealed`) :
/// ```dart
/// switch (gesture) {
///   case TapGesture(element: null):            // tap sur la carte vide
///   case TapGesture(element: final SegmentObject s):
///   case TapGesture(element: final o?):        // tap sur un autre objet
///   case PointGesture(onMap: true):            // tout geste ponctuel sur le vide
///   case DragGesture(dragged: final d?):
///   ...
/// }
/// ```
sealed class MapGesture {
  const MapGesture(this.position);

  final PointerPosition position;

  WorldOffset get world => position.world;
  ScreenOffset get screen => position.screen;
}

// ---------------------------------------------------------------------------
// Gestes ponctuels : portent l'objet touché, ou `null` si c'est la carte.
// ---------------------------------------------------------------------------

sealed class PointGesture extends MapGesture {
  const PointGesture(super.position, {required this.hit});

  /// Objet touché, `null` si le geste a lieu sur la carte vide.
  final MapHit? hit;

  bool get onMap => hit == null;
  MapObject? get element => hit?.object; // le reste du code ne change pas

  ContextMenuOverlay<AppMode> get menuAt =>
      onMap ? MapGeoMenu(super.position.world) : MapObjectMenu(hit!);
}

final class PressGesture extends PointGesture {
  const PressGesture(super.position, {required super.hit});
}

final class TapGesture extends PointGesture {
  const TapGesture(super.position, {required super.hit});
}

final class DoubleTapGesture extends PointGesture {
  const DoubleTapGesture(super.position, {required super.hit});
}

final class LongPressGesture extends PointGesture {
  const LongPressGesture(super.position, {required super.hit});
}

final class SecondaryTapGesture extends PointGesture {
  const SecondaryTapGesture(super.position, {required super.hit});
}

// ---------------------------------------------------------------------------
// Gestes de glissement : portent l'objet déplacé (`dragged`).
// ---------------------------------------------------------------------------

sealed class DragGesture extends MapGesture {
  const DragGesture(super.position, {required this.dragged});

  /// Objet saisi au début du glissement, `null` si on glisse la carte.
  final MapObject? dragged;
}

final class DragStartGesture extends DragGesture {
  const DragStartGesture(super.position, {required super.dragged});
}

final class DragCancelGesture extends DragGesture {
  const DragCancelGesture(super.position, {required super.dragged});
}

/// Glissement en cours ou terminé : connaît aussi l'objet survolé (`target`).
sealed class DragTrackingGesture extends DragGesture {
  const DragTrackingGesture(
    super.position, {
    required super.dragged,
    required this.hit,
  });

  /// Objet sous le pointeur, `null` si le pointeur est sur la carte vide.
  final MapHit? hit;
  ContextMenuOverlay<AppMode> get menuAt =>
      (hit == null) ? MapGeoMenu(super.position.world) : MapObjectMenu(hit!);
}

final class DragUpdateGesture extends DragTrackingGesture {
  const DragUpdateGesture(
    super.position, {
    required super.dragged,
    required super.hit,
  });
}

final class DragEndGesture extends DragTrackingGesture {
  const DragEndGesture(
    super.position, {
    required super.dragged,
    required super.hit,
  });
}
