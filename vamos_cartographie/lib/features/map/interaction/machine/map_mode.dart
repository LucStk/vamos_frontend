import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';

part 'map_mode.freezed.dart';

@freezed
sealed class MapMode with _$MapMode {
  const factory MapMode.idle() = Idle;

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
