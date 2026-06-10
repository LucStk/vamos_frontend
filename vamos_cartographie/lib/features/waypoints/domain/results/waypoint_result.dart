import "package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart";
import "package:vamos_cartographie/features/topology/topology.dart";
import "package:freezed_annotation/freezed_annotation.dart";
part "waypoint_result.freezed.dart";

@freezed
abstract class CreateWaypointResult with _$CreateWaypointResult {
  const factory CreateWaypointResult({
    required Waypoint waypoint,
    required Vertex vertex,
  }) = _CreateWaypointResult;
}
