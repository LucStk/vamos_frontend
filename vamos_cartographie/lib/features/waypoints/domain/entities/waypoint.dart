import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/types/waypoint_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import "package:vamos_cartographie/core/type/has_id.dart";
part 'waypoint.freezed.dart';

@freezed
abstract class Waypoint with _$Waypoint implements HasId<Waypoint> {
  const Waypoint._();
  const factory Waypoint({
    required Id<Waypoint> id,
    required Id<Vertex> vertexId,
    @Default('') String title,
    @Default(WaypointType.waypoint) WaypointType type,
    @Default('') String description,
    @Default([]) List<MediaImage> images,
  }) = _Waypoint;
  WaypointDraft toDraft() {
    return WaypointDraft(
      title: title,
      type: type,
      description: description,
      images: images,
    );
  }
}

@freezed
abstract class WaypointDraft with _$WaypointDraft {
  const WaypointDraft._();
  const factory WaypointDraft({
    @Default('') String title,
    @Default(WaypointType.waypoint) WaypointType type,
    @Default('') String description,
    @Default([]) List<MediaImage> images,
  }) = _WaypointDraft;
  Waypoint toWaypoint(Id<Waypoint> id, Id<Vertex> vertexId) {
    return Waypoint(
      vertexId: vertexId,
      title: title,
      description: description,
      type: type,
      images: images,
      id: id,
    );
  }
}
