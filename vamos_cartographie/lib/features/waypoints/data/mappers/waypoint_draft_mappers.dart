import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/vertex.dart';
import 'waypoint_enum_mapper.dart';
import "package:latlong2/latlong.dart";
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import "package:vamos_cartographie/features/shared/shared.dart";

class WaypointDraftMapper {
  static GWaypointCreateInput toGQLInput(
    WaypointDraft waypointDraft,
    Id<Vertex>? vertexId,
    LatLng? latlng,
  ) => GWaypointCreateInput(
    poiCategory: waypointDraft.poiCategory.toGQL(),
    description: waypointDraft.description.isNotEmpty
        ? Value.present(waypointDraft.description)
        : const Value.absent(),
    title: waypointDraft.title.isNotEmpty
        ? Value.present(waypointDraft.title)
        : const Value.absent(),
    latLng: (latlng != null)
        ? Value.present(GisMapper.toGQL(latlng))
        : const Value.absent(),
    vertexId: (vertexId != null)
        ? Value.present(vertexId.value)
        : const Value.absent(),
  );

  static GWaypointUpdateInput toGQLUpdateInput(WaypointDraft waypointDraft) =>
      GWaypointUpdateInput(
        poiCategory: Value.present(waypointDraft.poiCategory.toGQL()),
        description: waypointDraft.description.isNotEmpty
            ? Value.present(waypointDraft.description)
            : const Value.absent(),
        title: waypointDraft.title.isNotEmpty
            ? Value.present(waypointDraft.title)
            : const Value.absent(),
      );
}
