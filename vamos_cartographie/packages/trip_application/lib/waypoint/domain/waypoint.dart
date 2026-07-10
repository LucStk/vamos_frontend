import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "poi_category_types.dart";
import "/topology/topology.dart";
part 'waypoint.freezed.dart';

@freezed
abstract class Waypoint with _$Waypoint implements HasId {
  const Waypoint._();
  const factory Waypoint({
    required WaypointId id,
    required VertexId vertexId,
    @Default('') String title,
    @Default(PoiCategory.waypoint) PoiCategory poiCategory,
    @Default('') String description,
  }) = _Waypoint;
}

typedef WaypointId = Id<Waypoint>;
