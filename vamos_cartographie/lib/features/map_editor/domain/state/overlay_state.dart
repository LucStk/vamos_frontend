import "package:freezed_annotation/freezed_annotation.dart";
import "package:vamos_cartographie/features/map_ui/rendering/elements/marker_ui_element.dart";
part "overlay_state.freezed.dart";

@freezed
sealed class MapOverlayState with _$MapOverlayState {
  const factory MapOverlayState.hidden() = OverlayHidden;

  const factory MapOverlayState.popup({required MarkerUiElement element}) =
      OverlayPopup;
}
