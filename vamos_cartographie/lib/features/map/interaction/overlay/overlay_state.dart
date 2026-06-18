import "package:freezed_annotation/freezed_annotation.dart";

import "anchor.dart";

part "overlay_state.freezed.dart";

@freezed
sealed class MapOverlayState with _$MapOverlayState {
  const factory MapOverlayState.hidden() = OverlayHidden;

  const factory MapOverlayState.popup({required OverlayAnchor anchor}) =
      OverlayPopup;
}
