import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_enum_mapper.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

class WaypointMapper {
  /// Convertit un [GWaypointFieldsData] (fragment GQL) en [Waypoint] domaine.
  static Waypoint fromGQL(GWaypointFields data) => Waypoint(
    id: data.id,
    vertexId: data.vertex.id,
    type: data.type.toDomain(),
    title: data.title,
    description: data.description,
  );
}
