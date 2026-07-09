import 'package:domain_core/domain_core.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/waypoint/data/graphql/__generated__/waypoint_fields.data.gql.dart';
import 'package:vamos_cartographie/waypoint/data/mappers/waypoint_enum_mapper.dart';
import '/core/graphql/graphql.dart';

import 'package:trip_domain/trip_domain.dart';

class WaypointMapper {
  /// Convertit un [GWaypointFieldsData] (fragment GQL) en [Waypoint] domaine.
  static Waypoint fromGQL(GWaypointFields data) => Waypoint(
    id: Id<Waypoint>(data.id),
    vertexId: Id<Vertex>(data.vertex.id),
    poiCategory: data.poiCategory.toDomain(),
    title: data.title,
    description: data.description,
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
