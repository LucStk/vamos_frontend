import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

final List<Waypoint> t3Waypoints = [
  Waypoint(
    id: Id<Waypoint>(30),
    vertexId: Id<Vertex>(30),
    title: "départ",
    poiCategory: PoiCategory.start,
    description: 'Départ de Bayonne',
  ),
  Waypoint(
    id: Id<Waypoint>(31),
    vertexId: Id<Vertex>(31),
    title: "Super point d'eau",
    poiCategory: PoiCategory.water,
    description: "Point d'eau au gave de Pau",
  ),
  Waypoint(
    id: Id<Waypoint>(32),
    vertexId: Id<Vertex>(32),
    poiCategory: PoiCategory.camping,
    description: 'Nuit en camping à Tarbes',
  ),
  Waypoint(
    id: Id<Waypoint>(33),
    vertexId: Id<Vertex>(33),
    poiCategory: PoiCategory.end,
    description: 'Arrivée à Lourdes',
  ),
];
