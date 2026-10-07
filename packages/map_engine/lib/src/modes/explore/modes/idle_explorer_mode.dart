part of "../map_explore_mode.dart";

/// Comportement partagé par tous les modes d'exploration (équivalent d'IdleBehavior).
mixin ExploreBehavior on MapExploreMode {
  @override
  GestureResult<MapExploreMode> onTap(TapGesture g) => switch (g.element) {
    MapTripObject e => GestureResult.to(TripSelectMode(trip: e)),
    // MapUserLocation _ || null => GestureResult.to(),
    _ => GestureResult.none(),
  };
}

@freezed
final class IdleExplorer extends MapExploreMode
    with ExploreBehavior, _$IdleExplorer {
  IdleExplorer();

  MapExploreMode withSelection(MapObject? s) =>
      s is MapTripObject ? TripSelectMode(trip: s) : this;
}
