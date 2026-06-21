import 'package:domain_core/has_id.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "poi_category_types.dart";
import "media_image.dart";
import "package:topology_engine/topology_engine.dart";
part 'waypoint.freezed.dart';

@freezed
abstract class Waypoint with _$Waypoint implements HasId<Waypoint> {
  const Waypoint._();
  const factory Waypoint({
    required Id<Waypoint> id,
    required Id<Vertex> vertexId,
    @Default('') String title,
    @Default(PoiCategory.waypoint) PoiCategory poiCategory,
    @Default('') String description,
    @Default([]) List<MediaImage> images,
  }) = _Waypoint;
  WaypointDraft toDraft() {
    return WaypointDraft(
      title: title,
      poiCategory: poiCategory,
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
    @Default(PoiCategory.waypoint) PoiCategory poiCategory,
    @Default('') String description,
    @Default([]) List<MediaImage> images,
  }) = _WaypointDraft;
  Waypoint toWaypoint(Id<Waypoint> id, Id<Vertex> vertexId) {
    return Waypoint(
      vertexId: vertexId,
      title: title,
      description: description,
      poiCategory: poiCategory,
      images: images,
      id: id,
    );
  }
}
