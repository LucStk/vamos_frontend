part of "../../../map_editor_mode.dart";

@freezed
sealed class InitTripMode extends MapEditorMode with _$InitTripMode {
  InitTripMode._();

  factory InitTripMode() = _InitTripMode;

  // @override
  // Transition<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
  //   MapUserLocation() => Transition(mode: withPopupPosition(g.offset)),
  //   null => Transition(mode: withPopupPosition(g.offset)),
  //   _ => Transition.stay(),
  // };
}
