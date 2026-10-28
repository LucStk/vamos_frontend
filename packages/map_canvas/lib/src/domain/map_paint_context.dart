enum MapObjectVisualState { normal, selected, hovered, dragging }

class MapPaintContext {
  const MapPaintContext({
    this.state = MapObjectVisualState.normal,
    MapObjectVisualState? from,
    this.t = 1.0,
    this.previous,
    this.time = 0,
  }) : from = from ?? state;

  /// État vers lequel on transitionne (état stable si t == 1).
  final MapObjectVisualState state;

  /// État de départ de la transition en cours.
  /// Ignoré si [previous] est non nul.
  final MapObjectVisualState from;

  /// Progression from → state. 0 = from, 1 = state.
  final double t;

  /// Transition interrompue, figée à son `t` d'interruption. Quand elle est
  /// présente, le look de départ est son look résolu, pas `lookOf(from)` :
  /// c'est ce qui évite le saut visuel.
  final MapPaintContext? previous;

  /// Secondes écoulées, horloge continue pour les animations en boucle.
  /// Vaut 0 quand aucune boucle ne tourne. Sans rapport avec [t], qui est
  /// une transition finie.
  final double time;
}
