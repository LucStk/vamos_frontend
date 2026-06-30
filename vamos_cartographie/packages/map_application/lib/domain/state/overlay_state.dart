import "package:freezed_annotation/freezed_annotation.dart";
import "package:map_application/domain/state/popup_state.dart";
part "overlay_state.freezed.dart";

@freezed
sealed class MapOverlayState with _$MapOverlayState {
  const factory MapOverlayState.hidden() = OverlayHidden;

  const factory MapOverlayState.popup({required PopUpState popUpState}) =
      OverlayPopup;
}
