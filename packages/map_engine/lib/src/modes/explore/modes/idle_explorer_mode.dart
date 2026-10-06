part of "../map_explore_mode.dart";

/// Comportement partagé par tous les modes d'exploration (équivalent d'IdleBehavior).
mixin ExploreBehavior on MapExploreMode {
  MapExploreMode withPopupPosition(ScreenOffset position);

  @override
  GestureResult<MapExploreMode> onTap(TapGesture g) => switch (g.element) {
    MapTripObject e => GestureResult.to(TripSelectMode(trip: e)),
    MapUserLocation _ || null => GestureResult.to(withPopupPosition(g.offset)),
    _ => GestureResult.none(),
  };
}

@freezed
final class IdleExplorer extends MapExploreMode
    with ExploreBehavior, _$IdleExplorer {
  IdleExplorer({this.popUpPosition});

  @override
  final PopUpPositionType popUpPosition;

  @override
  IdleExplorer withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);

  MapExploreMode withSelection(MapObject? s) =>
      s is MapTripObject ? TripSelectMode(trip: s) : this;
}
