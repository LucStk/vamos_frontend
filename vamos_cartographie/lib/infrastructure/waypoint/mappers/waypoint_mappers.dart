import 'package:domain_core/domain_core.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';

import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/features/shared/data/mappers/gis_mapper.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/mappers/waypoint_enum_mapper.dart';

class WaypointMapper {
  /// Convertit un [GWaypointFieldsData] (fragment GQL) en [Waypoint] domaine.
  static Waypoint fromGQL(GWaypointFields data) => Waypoint(
    id: Id<Waypoint>(data.id),
    vertexId: Id<Vertex>(data.vertex.id),
    poiCategory: data.poiCategory.toDomain(),
    title: data.title,
    description: data.description,
  );
  static GWaypointCreateInput toGQLInput(
    Waypoint waypointDraft,
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

  static GWaypointUpdateInput toGQLUpdateInput(Waypoint waypointDraft) =>
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
