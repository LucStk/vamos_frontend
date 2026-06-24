import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';

import 'package:trip_domain/trip_domain.dart';
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
}
