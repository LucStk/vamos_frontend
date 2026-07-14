import 'package:domain_core/domain/graph_node_state.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_application/trip_application.dart';
part 'waypoint.freezed.dart';

typedef WaypointId = Id<Waypoint>;

@freezed
abstract class Waypoint with _$Waypoint implements Patchable<Waypoint> {
  const Waypoint._();
  const factory Waypoint({
    required Id<Waypoint> id,
    required VertexId vertexId,
    @Default('') String title,
    @Default(PoiCategory.waypoint) PoiCategory poiCategory,
    @Default('') String description,
  }) = _Waypoint;

  @override
  Patch<Waypoint> createPatch() {
    return WaypointPatch.internal(
      id: id,
      vertexId: vertexId,
      title: title,
      poiCategory: poiCategory,
      description: description,
      recomputing: false,
    );
  }
}

@freezed
abstract class WaypointPatch with _$WaypointPatch implements Patch<Waypoint> {
  @Implements<Patch<Waypoint>>()
  const factory WaypointPatch.internal({
    required Id<Waypoint> id,
    required VertexId vertexId,
    required String title,
    required PoiCategory poiCategory,
    required String description,
    required bool recomputing,
    Object? error,
  }) = _WaypointPatch;

  const WaypointPatch._();

  factory WaypointPatch({
    Id<Waypoint>? id,
    required VertexId vertexId,
    String? title,
    PoiCategory? poiCategory,
    String? description,
    bool recomputing = false,
    Object? error,
  }) {
    return WaypointPatch.internal(
      id: id ?? Id<Waypoint>.generate(),
      vertexId: vertexId,
      poiCategory: poiCategory ?? PoiCategory.waypoint,
      title: title ?? "",
      description: description ?? "",
      recomputing: recomputing,
      error: error,
    );
  }

  @override
  Waypoint toEntity() => Waypoint(
    id: id,
    vertexId: vertexId,
    poiCategory: poiCategory,
    title: title,
    description: description,
  );
}
