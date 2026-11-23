import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';

final class BadgeLook implements Lerpable<BadgeLook> {
  const BadgeLook({
    required this.scale,
    required this.casing,
    required this.halo,
    required this.lift,
    this.opacity = 1.0,
  });

  /// Multiplicateur du rayon au repos.
  final double scale;

  /// Épaisseur de l'anneau clair (px).
  final double casing;

  /// Épaisseur ajoutée pour le halo (px), 0 = aucun.
  final double halo;

  /// 0..1 : éclaircissement vers le blanc.
  final double lift;

  /// 0..1 : transparence de toute la pastille (objet écarté de la scène).
  final double opacity;

  @override
  BadgeLook lerp(BadgeLook o, double t) => BadgeLook(
    scale: lerpDouble(scale, o.scale, t)!,
    casing: lerpDouble(casing, o.casing, t)!,
    halo: lerpDouble(halo, o.halo, t)!,
    lift: lerpDouble(lift, o.lift, t)!,
    opacity: lerpDouble(opacity, o.opacity, t)!,
  );
}
