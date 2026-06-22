import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/waypoint.dart';
import 'package:topology_engine/topology_engine.dart';

part 'map_mode.freezed.dart';

@freezed
sealed class MapMode with _$MapMode {
  const factory MapMode.idle() = Idle;
  const factory MapMode.cursorDrawn({required LatLng latLng}) = CursorDrawn;

  const factory MapMode.vertexSelected({required Id<Vertex> vertexId}) =
      VertexSelected;

  const factory MapMode.draggingVertex({required Id<Vertex> vertexId}) =
      DraggingVertex;

  const factory MapMode.segmentSelected({required Id<Segment> segmentId}) =
      SegmentSelected;

  const factory MapMode.creatingSegment({Id<Segment>? segmentId}) =
      CreatingSegment;

  const factory MapMode.splittingSegment({required Id<Segment> segmentId}) =
      SplittingSegment;

  const factory MapMode.waypointSelected({required Id<Waypoint> waypointId}) =
      WaypointSelected;
}
