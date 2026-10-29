// map_engine/lib/src/domain/map_hit.dart  (à exporter depuis map_engine.dart)
import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';

/// Résultat d'un hit-test : l'objet touché ET l'endroit précis sur lui.
///
/// [point] vaut :
/// - le centre de l'objet pour un objet ponctuel (poignée de départ/arrivée,
///   waypoint) : le point « accroché », pas la position brute du doigt ;
/// - la projection du pointeur sur le tracé pour une ligne (section de route).
///
/// C'est exactement ce qu'il faut pour poser une ancre de route :
///   SectionAnchor(id: section.id, position: hit.point)
///   EndpointAnchor(endpoint: ..., position: hit.point)
///
/// Le moteur de gestes continue de raisonner sur [object] (identité stable,
/// comparable d'un événement à l'autre) ; [point] est un instantané pris au
/// moment du hit-test.
final class MapHit {
  const MapHit({required this.object, required this.point});

  final MapObject object;
  final WorldOffset point;
}

/// Point du segment [a, b] le plus proche de [p] (tout en coordonnées monde).
WorldOffset nearestPointOnSegment(WorldOffset a, WorldOffset b, WorldOffset p) {
  final ab = b.value - a.value;
  final len2 = ab.dx * ab.dx + ab.dy * ab.dy;
  if (len2 == 0) return a;
  final ap = p.value - a.value;
  final t = ((ap.dx * ab.dx + ap.dy * ab.dy) / len2).clamp(0.0, 1.0);
  return WorldOffset(a.value + ab * t);
}
