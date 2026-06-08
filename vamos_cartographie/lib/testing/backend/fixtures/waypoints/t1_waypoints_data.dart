import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

final List<Waypoint> t1Waypoints = [
  Waypoint(
    id: 10,
    vertexId: 10,
    type: WaypointType.start,
    description: 'Départ depuis Paris',
  ),
  Waypoint(
    id: 11,
    vertexId: 11,
    type: WaypointType.waypoint,
    description: 'Étape à Rennes — centre historique',
  ),
  Waypoint(
    id: 12,
    vertexId: 12,
    type: WaypointType.viewpoint,
    description: 'Vue sur la rade de Brest',
  ),

  Waypoint(
    id: 14,
    vertexId: 14,
    type: WaypointType.end,
    description: 'Arrivée à Nantes',
  ),
];
