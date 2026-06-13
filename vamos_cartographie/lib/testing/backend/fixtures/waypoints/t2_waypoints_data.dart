import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

final List<Waypoint> t2Waypoints = [
  Waypoint(
    id: Id<Waypoint>(21),
    vertexId: Id<Vertex>(21),
    type: WaypointType.start,
    description: 'Départ de Strasbourg',
  ),
  Waypoint(
    id: Id<Waypoint>(22),
    vertexId: Id<Vertex>(22),
    type: WaypointType.historic,
    description: 'Patrimoine médiéval de Sélestat',
  ),
  Waypoint(
    id: Id<Waypoint>(24),
    vertexId: Id<Vertex>(24),
    type: WaypointType.viewpoint,
    description: 'Point de vue sur les vignes',
  ),
  Waypoint(
    id: Id<Waypoint>(25),
    vertexId: Id<Vertex>(25),
    type: WaypointType.end,
    description: 'Arrivée à Mulhouse',
  ),
];
