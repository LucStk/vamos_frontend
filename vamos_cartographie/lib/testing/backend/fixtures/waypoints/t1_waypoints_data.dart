import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

final List<Waypoint> t1Waypoints = [
  Waypoint(
    id: Id<Waypoint>(10),
    vertexId: Id<Vertex>(10),
    poiCategory: PoiCategory.start,
    description: 'Départ depuis Paris',
  ),
  Waypoint(
    id: Id<Waypoint>(11),
    vertexId: Id<Vertex>(11),
    poiCategory: PoiCategory.waypoint,
    description: 'Étape à Rennes — centre historique',
  ),
  Waypoint(
    id: Id<Waypoint>(12),
    vertexId: Id<Vertex>(12),
    poiCategory: PoiCategory.viewpoint,
    description: 'Vue sur la rade de Brest',
  ),

  Waypoint(
    id: Id<Waypoint>(14),
    vertexId: Id<Vertex>(14),
    poiCategory: PoiCategory.end,
    description: 'Arrivée à Nantes',
  ),
];
