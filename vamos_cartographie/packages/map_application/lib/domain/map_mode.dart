import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';

part 'map_mode.freezed.dart';

@freezed
sealed class MapMode with _$MapMode {
  const factory MapMode.idle() = Idle;
  const factory MapMode.cursorDrawn({required LatLng latLng}) = CursorDrawn;

  const factory MapMode.vertexSelected({required VertexRef vertexRef}) =
      VertexSelected;

  const factory MapMode.draggingVertex({required VertexRef vertexRef}) =
      DraggingVertex;

  const factory MapMode.segmentSelected({required SegmentRef segmentRef}) =
      SegmentSelected;

  const factory MapMode.creatingSegment({SegmentRef? segmentRef}) =
      CreatingSegment;

  const factory MapMode.splittingSegment({required SegmentRef segmentRef}) =
      SplittingSegment;

  const factory MapMode.waypointSelected({required Id<Waypoint> waypointId}) =
      WaypointSelected;
}
