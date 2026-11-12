import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';

final class BadgeLook implements Lerpable<BadgeLook> {
  const BadgeLook({
    required this.scale,
    required this.casing,
    required this.halo,
    required this.lift,
  });

  /// Multiplicateur du rayon au repos.
  final double scale;

  /// Épaisseur de l'anneau clair (px).
  final double casing;

  /// Épaisseur ajoutée pour le halo (px), 0 = aucun.
  final double halo;

  /// 0..1 : éclaircissement vers le blanc.
  final double lift;

  @override
  BadgeLook lerp(BadgeLook o, double t) => BadgeLook(
    scale: lerpDouble(scale, o.scale, t)!,
    casing: lerpDouble(casing, o.casing, t)!,
    halo: lerpDouble(halo, o.halo, t)!,
    lift: lerpDouble(lift, o.lift, t)!,
  );
}
