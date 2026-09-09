import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_application/domain/map_elements.dart';
import 'map_mode.dart';

part 'map_editor_state.freezed.dart';

@freezed
abstract class MapContextState with _$MapContextState {
  const factory MapContextState({
    @Default(Idle()) MapMode mode,
    @Default(NoMapElement()) MapElement selection,
  }) = _MapContextState;
}

// @freezed
// abstract class PopUpState with _$PopUpState {
//   const factory PopUpState({required LatLng latLng}) = _PopUpState;
// }

// @freezed
// sealed class MapOverlayState with _$MapOverlayState {
//   const factory MapOverlayState.hidden() = OverlayHidden;

//   const factory MapOverlayState.popup({required PopUpState popUpState}) =
//       OverlayPopup;
// }
