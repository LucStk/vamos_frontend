import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';

/// Valeurs interpolables d'un segment dans un état donné.
final class SegmentLook implements Lerpable<SegmentLook> {
  const SegmentLook({
    required this.widthScale,
    required this.casing,
    required this.halo,
    required this.lift,
  });

  /// Multiplicateur de la largeur de base (`visualRadius * 2`).
  final double widthScale;

  /// Liseré clair de chaque côté (px).
  final double casing;

  /// Épaisseur ajoutée pour le halo (px), 0 = aucun.
  final double halo;

  /// 0..1 : éclaircissement vers le blanc.
  final double lift;

  @override
  SegmentLook lerp(SegmentLook o, double t) => SegmentLook(
    widthScale: lerpDouble(widthScale, o.widthScale, t)!,
    casing: lerpDouble(casing, o.casing, t)!,
    halo: lerpDouble(halo, o.halo, t)!,
    lift: lerpDouble(lift, o.lift, t)!,
  );
}
