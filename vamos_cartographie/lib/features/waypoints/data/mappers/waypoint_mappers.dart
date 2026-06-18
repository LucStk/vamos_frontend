import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_enum_mapper.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

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
