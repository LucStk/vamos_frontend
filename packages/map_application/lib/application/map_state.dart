import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_state.freezed.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default(Idle()) MapMode mode,
    @Default(MapSelection.none()) MapSelection selection,
    @Default(MapOverlayState.hidden()) MapOverlayState overlay,
  }) = _MapState;
}

@freezed
sealed class MapMode with _$MapMode {
  const factory MapMode.idle() = Idle;
  const factory MapMode.sketchMode({
    required VertexId vertexStart,
    required List<LatLng> itineraire,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
  }) = SketchMode;
}

@freezed
sealed class MapSelection with _$MapSelection {
  const factory MapSelection.none() = NoSelection;
  const factory MapSelection.vertex({required VertexId vertexId}) =
      VertexSelection;
  const factory MapSelection.segment({required SegmentId segmentId}) =
      SegmentSelection;
  const factory MapSelection.cursor({required LatLng latLng}) = CursorSelection;
}

extension MapSelectionX on MapSelection {
  LatLng? get cursorLatLngOrNull => switch (this) {
    CursorSelection(:final latLng) => latLng,
    _ => null,
  };

  VertexId? get vertexIdOrNull => switch (this) {
    VertexSelection(:final vertexId) => vertexId,
    _ => null,
  };
  SegmentId? get segmentIdOrNull => switch (this) {
    SegmentSelection(:final segmentId) => segmentId,
    _ => null,
  };
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
