import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

final List<Waypoint> t2Waypoints = [
  Waypoint(
    id: 21,
    vertexId: 21,
    type: WaypointType.start,
    description: 'Départ de Strasbourg',
  ),
  Waypoint(
    id: 22,
    vertexId: 22,
    type: WaypointType.historic,
    description: 'Patrimoine médiéval de Sélestat',
  ),

  Waypoint(
    id: 24,
    vertexId: 24,
    type: WaypointType.viewpoint,
    description: 'Point de vue sur les vignes',
  ),
  Waypoint(
    id: 25,
    vertexId: 25,
    type: WaypointType.end,
    description: 'Arrivée à Mulhouse',
  ),
];
