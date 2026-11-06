// objects/segment/geometry/rounded_polyline.dart
import 'dart:math' as math;
import 'dart:ui';

import 'package:domain_core/space/world_segment.dart';

/// Chemin passant par les sommets de [segments], chaque angle remplacé par
/// un raccord tangent aux deux côtés. Les portions droites restent droites.
///
/// [radius] est en unités monde : le virage garde donc une taille constante
/// par rapport au tracé, pas à l'écran.
Path roundedPolylinePath(
  List<WorldSegment> segments, {
  required double radius,
}) {
  final pts = _vertices(segments);
  final path = Path();
  if (pts.isEmpty) return path;
  if (pts.length == 1) return path..moveTo(pts.first.dx, pts.first.dy);

  path.moveTo(pts.first.dx, pts.first.dy);

  for (var i = 1; i < pts.length - 1; i++) {
    final a = pts[i - 1];
    final b = pts[i];
    final c = pts[i + 1];

    final v1 = a - b;
    final v2 = c - b;
    final l1 = v1.distance;
    final l2 = v2.distance;

    // Jamais plus de la moitié du côté le plus court : deux virages voisins
    // ne peuvent pas empiéter l'un sur l'autre, même sur un zigzag serré.
    final d = math.min(radius, math.min(l1, l2) / 2);

    final p1 = b + v1 * (d / l1);
    final p2 = b + v2 * (d / l2);

    path.lineTo(p1.dx, p1.dy);
    // Point de contrôle sur le sommet : la quadratique est tangente aux
    // deux côtés, et ne dépasse jamais le triangle p1-b-p2.
    path.quadraticBezierTo(b.dx, b.dy, p2.dx, p2.dy);
  }

  path.lineTo(pts.last.dx, pts.last.dy);
  return path;
}

/// Sommets de la polyligne, doublons consécutifs écartés : un sommet
/// dupliqué donnerait une division par zéro dans le calcul du raccord.
List<Offset> _vertices(List<WorldSegment> segments) {
  final out = <Offset>[];
  for (final s in segments) {
    final a = s.$1.value;
    final b = s.$2.value;
    if (out.isEmpty || (a - out.last).distance > 1e-9) out.add(a);
    if ((b - out.last).distance > 1e-9) out.add(b);
  }
  return out;
}
