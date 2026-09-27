enum MapObjectVisualState { normal, selected, hovered, dragging }

class MapPaintContext {
  const MapPaintContext({
    this.state = MapObjectVisualState.normal,
    MapObjectVisualState? from,
    this.t = 1.0,
  }) : from = from ?? state;

  /// État vers lequel on transitionne (état stable si t == 1).
  final MapObjectVisualState state;

  /// État de départ de la transition en cours.
  /// Égal à [state] par défaut (= pas d'animation, comportement d'avant).
  final MapObjectVisualState from;

  /// Progression from → state. 0 = from, 1 = state.
  final double t;
}
