import 'package:domain_core/has_id.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "/domain/value_objects/poi_category_types.dart";
import "media_image.dart";
import "package:topology_engine/topology_engine.dart";
part 'waypoint.freezed.dart';

typedef WaypointId = Id<Waypoint>;

@freezed
abstract class Waypoint with _$Waypoint implements HasId<Waypoint> {
  const Waypoint._();
  const factory Waypoint({
    required WaypointId id,
    required VertexId vertexId,
    @Default('') String title,
    @Default(PoiCategory.waypoint) PoiCategory poiCategory,
    @Default('') String description,
  }) = _Waypoint;
  WaypointDraft toDraft() {
    return WaypointDraft(
      title: title,
      poiCategory: poiCategory,
      description: description,
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
  }) = _WaypointDraft;
  Waypoint toWaypoint(WaypointId id, VertexId vertexId) {
    return Waypoint(
      vertexId: vertexId,
      title: title,
      description: description,
      poiCategory: poiCategory,
      id: id,
    );
  }
}
