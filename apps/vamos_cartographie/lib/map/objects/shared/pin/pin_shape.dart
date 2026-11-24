import 'dart:math';
import 'dart:ui';

import 'package:domain_core/domain_core.dart';

/// La goutte : un disque prolongé par une pointe, qui désigne un point au
/// lieu de le recouvrir.
///
/// Partagée par les waypoints, le curseur de recherche et la localisation.
/// Toutes ses longueurs sont en pixels écran, la pointe à l'origine : les
/// chemins obtenus se passent à `DrawAnchoredPath`, ancrés sur le point.
abstract final class PinShape {
  /// Direction de la pointe vers la tête : droit vers le haut de l'écran.
  static const upright = -pi / 2;

  /// Distance de la pointe au centre de la tête, en rayons de tête.
  static const tipRatio = 1.9;

  /// Centre de la tête, pour une tête de rayon [radius] dans la direction
  /// [direction] (radians, repère de l'écran).
  static Offset head(double radius, {double direction = upright}) =>
      Offset(cos(direction), sin(direction)) * (radius * tipRatio);

  /// Le contour : la pointe en [tip], la tête de rayon [r] centrée en [head],
  /// et les deux tangentes qui les relient.
  static Path path(Offset tip, Offset head, double r) {
    final toHead = head - tip;
    final d = toHead.distance;
    final phi = atan2(toHead.dy, toHead.dx);
    // Les points de tangence sont vus du centre à ±gamma de la direction de
    // la pointe.
    final gamma = acos((r / d).clamp(0.0, 1.0));
    final fromHeadToTip = phi + pi;
    Offset onCircle(double a) => head + Offset(cos(a), sin(a)) * r;

    return Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(
        onCircle(fromHeadToTip + gamma).dx,
        onCircle(fromHeadToTip + gamma).dy,
      )
      ..arcTo(
        Rect.fromCircle(center: head, radius: r),
        fromHeadToTip + gamma,
        2 * pi - 2 * gamma,
        false,
      )
      ..close();
  }

  /// Vrai si [p] est à moins de [hitRadius] du segment pointe → tête : on
  /// touche l'épingle sur toute sa longueur.
  ///
  /// [tip], [headOffset] et [hitRadius] sont respectivement en unités monde,
  /// en pixels écran et en unités monde.
  static bool isHitAt(
    WorldOffset p, {
    required Offset tip,
    required Offset headOffset,
    required double zoomScale,
    required double hitRadius,
  }) {
    final head = tip + headOffset / zoomScale;
    final ab = head - tip;
    final len2 = ab.dx * ab.dx + ab.dy * ab.dy;
    final ap = p.value - tip;
    final t = len2 == 0
        ? 0.0
        : ((ap.dx * ab.dx + ap.dy * ab.dy) / len2).clamp(0.0, 1.0);
    final nearest = tip + ab * t;
    return (p.value - nearest).distance <= hitRadius;
  }
}
