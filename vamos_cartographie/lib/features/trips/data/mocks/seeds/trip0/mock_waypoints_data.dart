import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

final List<Waypoint> tripWaypoints = [
  Waypoint(
    id: 0,
    vertexId: 0,
    type: WaypointType.start,
    description: 'Départ depuis Paris',
  ),
  Waypoint(
    id: 1,
    vertexId: 1,
    type: WaypointType.waypoint,
    description: 'Étape à Rennes — centre historique',
  ),
  Waypoint(
    id: 2,
    vertexId: 2,
    type: WaypointType.viewpoint,
    description: 'Vue sur la rade de Brest',
  ),
  Waypoint(
    id: 3,
    vertexId: 3,
    type: WaypointType.food,
    description: 'Ravitaillement au marché de Vannes',
  ),
  Waypoint(
    id: 4,
    vertexId: 4,
    type: WaypointType.end,
    description: 'Arrivée à Nantes',
  ),
];
