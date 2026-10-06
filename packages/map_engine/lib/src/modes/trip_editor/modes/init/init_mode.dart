part of "../../map_editor_mode.dart";

@freezed
final class InitTripMode extends MapEditorMode with _$InitTripMode {
  InitTripMode(this.popUpPosition);

  @override
  final PopUpPositionType popUpPosition;

  InitTripMode withPopupPosition(ScreenOffset? offset) =>
      copyWith(popUpPosition: offset);

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapUserLocation _ => () {
      return GestureResult(mode: withPopupPosition(g.offset));
    }(),
    null => GestureResult(mode: withPopupPosition(g.offset)),
    _ => GestureResult.none(),
  };
}
