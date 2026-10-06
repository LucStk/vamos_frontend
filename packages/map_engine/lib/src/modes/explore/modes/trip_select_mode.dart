part of "../map_explore_mode.dart";

@freezed
final class TripSelectMode extends MapExploreMode
    with ExploreBehavior, _$TripSelectMode {
  TripSelectMode({required this.trip, this.popUpPosition});

  final MapTripObject trip;

  @override
  final PopUpPositionType popUpPosition;

  @override
  MapTripObject get selection => trip;

  @override
  TripSelectMode withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);

  MapExploreMode withSelection(MapObject? s) => switch (s) {
    MapTripObject t => TripSelectMode(trip: t),
    _ => IdleExplorer(popUpPosition: popUpPosition),
  };
}

extension TripSelectIntents on TripSelectMode {
  GestureResult<MapExploreMode> deselect() =>
      GestureResult.to(IdleExplorer(popUpPosition: popUpPosition));
}
