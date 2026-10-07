part of "../../../map_editor_mode.dart";

@freezed
sealed class InitTripMode extends MapEditorMode with _$InitTripMode {
  InitTripMode._();

  factory InitTripMode() = _InitTripMode;

  // @override
  // GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
  //   MapUserLocation() => GestureResult(mode: withPopupPosition(g.offset)),
  //   null => GestureResult(mode: withPopupPosition(g.offset)),
  //   _ => GestureResult.none(),
  // };
}
