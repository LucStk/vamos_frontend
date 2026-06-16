// features/map/presentation/providers/map_state_provider.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
part 'map_cursor.freezed.dart';

@freezed
abstract class MapCursorState with _$MapCursorState {
  const factory MapCursorState({
    @Default(LatLng(0, 0)) LatLng latLng,
    @Default(false) bool isOpen,
    @Default(true) bool popUpOpen,
  }) = _MapCursorState;
}
