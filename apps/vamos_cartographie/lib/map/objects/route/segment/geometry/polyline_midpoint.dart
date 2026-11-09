// objects/segment/geometry/polyline_midpoint.dart
import 'dart:math' as math;

import 'package:domain_core/domain_core.dart';

/// Point situé à la moitié de la longueur cumulée d'une polyligne,
/// avec la direction de la portion qui le porte.
typedef PolylineMidpoint = ({WorldOffset position, double angle});

/// Renvoie le milieu *métrique* de [segments], et non le sommet central :
/// sur une polyligne irrégulière, le sommet central saute d'un côté à
/// l'autre dès qu'on ajoute un point.
///
/// [segments] est supposée contiguë et ordonnée. Renvoie `null` si la
/// polyligne est vide ou de longueur nulle (tous les points confondus),
/// cas où aucune position ni direction n'a de sens.
PolylineMidpoint? polylineMidpoint(List<WorldSegment> segments) {
  if (segments.isEmpty) return null;

  var total = 0.0;
  for (final s in segments) {
    total += (s.$2.value - s.$1.value).distance;
  }
  if (total == 0) return null;

  final half = total / 2;
  var travelled = 0.0;

  for (final s in segments) {
    final v = s.$2.value - s.$1.value;
    final len = v.distance;
    if (len == 0) continue; // sommet dupliqué : ignoré

    if (travelled + len >= half) {
      final t = (half - travelled) / len;
      return (position: WorldOffset(s.$1.value + v * t), angle: v.direction);
    }
    travelled += len;
  }

  // Inatteignable en théorie ; garde-fou contre l'accumulation d'erreurs
  // en virgule flottante sur une polyligne à nombreux sommets.
  final last = segments.lastWhere(
    (s) => (s.$2.value - s.$1.value).distance > 0,
  );
  return (position: last.$2, angle: (last.$2.value - last.$1.value).direction);
}

/// Angle de [m] redressé pour que le glyphe reste lisible : un pictogramme
/// orienté entre 90° et 270° se retrouverait la tête en bas.
///
/// Inutile si tu dessines le glyphe droit, ce que je recommande pour les
/// modalités — un vélo penché se lit mal.
double uprightAngle(PolylineMidpoint m) {
  final a = m.angle;
  return (a > math.pi / 2 || a < -math.pi / 2) ? a + math.pi : a;
}
