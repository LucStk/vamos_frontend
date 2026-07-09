import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/topology/domain/types/segment_ref.dart';
import 'package:trip_application/topology/domain/types/vertex_ref.dart';
import 'package:trip_application/waypoint/domain/waypoint.dart';

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
  const factory MapMode.cursorDrawn({required LatLng latLng}) = CursorDrawn;
  const factory MapMode.draggingVertex({required VertexRef vertexRef}) =
      DraggingVertex;
  const factory MapMode.creatingSegment({SegmentRef? segmentRef}) =
      CreatingSegment;
  const factory MapMode.splittingSegment({required SegmentRef segmentRef}) =
      SplittingSegment;
}

@freezed
sealed class MapSelection with _$MapSelection {
  const factory MapSelection.none() = NoSelection;
  const factory MapSelection.vertex({required VertexRef vertexRef}) =
      VertexSelection;
  const factory MapSelection.segment({required SegmentRef segmentRef}) =
      SegmentSelection;
  const factory MapSelection.waypoint({
    required Id<Waypoint> waypointId,
    required VertexRef vertexRef, // le vertex lié, résolu à la sélection
  }) = WaypointSelection;
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
