part of "../../../map_editor_mode.dart";

@freezed
sealed class InitTripMode extends MapEditorMode with _$InitTripMode {
  InitTripMode._({this.popUpPosition});

  factory InitTripMode({ScreenOffset? popUpPosition}) = _InitTripMode;

  @override
  final ScreenOffset? popUpPosition;

  InitTripMode withPopupPosition(ScreenOffset? offset) =>
      copyWith(popUpPosition: offset);

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapUserLocation() => GestureResult(mode: withPopupPosition(g.offset)),
    null => GestureResult(mode: withPopupPosition(g.offset)),
    _ => GestureResult.none(),
  };
}
