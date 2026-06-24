import 'package:domain_core/has_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_domain/domain/types/Ids.dart';
import 'package:trip_domain/runtime/store/graph_store.dart';
import "/domain/value_objects/poi_category_types.dart";
part 'waypoint.freezed.dart';

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
