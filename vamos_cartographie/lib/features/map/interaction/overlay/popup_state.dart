import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/pop_up.dart';
part "popup_state.freezed.dart";

@freezed
abstract class MapPopupState with _$MapPopupState {
  const factory MapPopupState({
    required LatLng latLng,
    required AbstractPopUp popUp,
  }) = _MapPopupState;
}
