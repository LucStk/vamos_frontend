import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

final List<Waypoint> t3Waypoints = [
  Waypoint(
    id: 30,
    vertexId: 30,
    title: "départ",
    type: WaypointType.start,
    description: 'Départ de Bayonne',
  ),
  Waypoint(
    id: 31,
    vertexId: 31,
    title: "Super point d'eau",
    type: WaypointType.water,
    description: "Point d'eau au gave de Pau",
  ),
  Waypoint(
    id: 32,
    vertexId: 32,
    type: WaypointType.camping,
    description: 'Nuit en camping à Tarbes',
  ),
  Waypoint(
    id: 33,
    vertexId: 33,
    type: WaypointType.end,
    description: 'Arrivée à Lourdes',
  ),
];
