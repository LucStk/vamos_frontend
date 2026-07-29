import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'map_mode.dart';
import 'map_selection.dart';

part 'map_state.freezed.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default(Idle()) MapMode mode,
    @Default(MapSelection.none()) MapSelection selection,
  }) = _MapState;
}

@freezed
abstract class PopUpState with _$PopUpState {
  const factory PopUpState({required LatLng latLng}) = _PopUpState;
}

@freezed
sealed class MapOverlayState with _$MapOverlayState {
  const factory MapOverlayState.hidden() = OverlayHidden;

  const factory MapOverlayState.popup({required PopUpState popUpState}) =
      OverlayPopup;
}
