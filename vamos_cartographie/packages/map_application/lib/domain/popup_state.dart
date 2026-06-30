import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part "popup_state.freezed.dart";

@freezed
abstract class PopUpState with _$PopUpState {
  const factory PopUpState({required LatLng latLng}) = _PopUpState;
}
