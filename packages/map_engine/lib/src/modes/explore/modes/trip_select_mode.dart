part of "../map_explore_mode.dart";

@freezed
final class TripSelectMode extends MapExploreMode
    with ExploreBehavior, _$TripSelectMode {
  TripSelectMode({required this.trip});

  final MapTripObject trip;

  MapExploreMode withSelection(MapObject? s) => switch (s) {
    MapTripObject t => TripSelectMode(trip: t),
    _ => IdleExplorer(),
  };
}

extension TripSelectIntents on TripSelectMode {
  GestureResult<MapExploreMode> deselect() => GestureResult.to(IdleExplorer());
}
