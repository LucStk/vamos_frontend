// domain/gestures/map_gesture.dart
import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_pointer_event.dart';

/// Geste sémantique sur la carte. Valeur pure, produite par `gesture_engine/`
/// et consommée par la machine à modes.
///
/// Exemples de filtrage (exhaustif grâce à `sealed`) :
/// ```dart
/// switch (gesture) {
///   case TapGesture(hit: null):                      // tap sur la carte vide
///   case TapGesture(element: final MapSection s):    // tap sur une section
///   case TapGesture(element: final o?):              // tap sur un autre objet
///   case DragStartGesture(sourceObject: RouteElements()):
///   case DragUpdateGesture(target: null):            // drag au-dessus du vide
///   ...
/// }
/// ```
sealed class MapGesture {
  const MapGesture(this.position);

  /// Position du pointeur au moment de l'événement qui produit le geste.
  final PointerPosition position;

  WorldOffset get world => position.world;
  ScreenOffset get screen => position.screen;
}

abstract interface class HitTrackingGesture {
  HitObject? get hit;
}

// ---------------------------------------------------------------------------
// Gestes ponctuels : portent l'objet touché, ou `null` si c'est la carte.
// ---------------------------------------------------------------------------

sealed class PointGesture extends MapGesture implements HitTrackingGesture {
  const PointGesture(super.position, {required this.hit});

  /// Objet touché, `null` si le geste a lieu sur la carte vide.
  @override
  final HitObject? hit;

  MapObject? get element => hit?.object;
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
// Gestes de glissement : portent la source (saisie au press).
// Les gestes en cours ou terminés portent aussi la cible (sous le doigt).
// ---------------------------------------------------------------------------

sealed class DragGesture extends MapGesture {
  const DragGesture(
    super.position, {
    required this.source,
    required this.pressPosition,
  });

  /// Ce qui a été saisi au press : l'objet et le point exact touché.
  /// Fixe pour toute la durée du drag.
  final HitObject source;

  /// Où le doigt s'est posé (`position` est le point courant).
  final PointerPosition pressPosition;

  /// Objet saisi, qu'il soit déplacé par le drag ou seulement point de départ
  /// d'un geste (voir `MapObject.isMovedByDrag`).
  MapObject get sourceObject => source.object;

  /// Distance écran parcourue par le doigt depuis le press.
  double get travelPx => (screen - pressPosition.screen).value.distance;
}

final class DragStartGesture extends DragGesture {
  const DragStartGesture(
    super.position, {
    required super.source,
    required super.pressPosition,
  });
}

final class DragCancelGesture extends DragGesture {
  const DragCancelGesture(
    super.position, {
    required super.source,
    required super.pressPosition,
  });
}

/// Glissement en cours ou terminé : connaît aussi la cible de dépôt.
sealed class DragTrackingGesture extends DragGesture {
  const DragTrackingGesture(
    super.position, {
    required super.source,
    required super.pressPosition,
    required this.target,
  });

  /// Objet sous le pointeur (hors source déplacée et hors proxys),
  /// `null` si le pointeur est sur la carte vide.
  final HitObject? target;
}

final class DragUpdateGesture extends DragTrackingGesture {
  const DragUpdateGesture(
    super.position, {
    required super.source,
    required super.pressPosition,
    required super.target,
  });
}

final class DragEndGesture extends DragTrackingGesture {
  const DragEndGesture(
    super.position, {
    required super.source,
    required super.pressPosition,
    required super.target,
  });
}
