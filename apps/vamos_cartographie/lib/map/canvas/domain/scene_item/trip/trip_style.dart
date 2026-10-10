import 'dart:math';
import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';

final class TripLook implements Lerpable<TripLook> {
  const TripLook({
    required this.borderWidth,
    required this.borderColor,
    required this.coreWidth,
    required this.coreColor,
    required this.haloSpread,
    required this.haloOpacity,
  });

  final double borderWidth, coreWidth;
  final Color borderColor, coreColor;

  /// Largeur ajoutée par le halo au-delà du contour (px).
  final double haloSpread;

  /// 0 = pas de halo, 1 = halo complet.
  final double haloOpacity;

  @override
  TripLook lerp(TripLook o, double t) => TripLook(
    borderWidth: lerpDouble(borderWidth, o.borderWidth, t)!,
    borderColor: Color.lerp(borderColor, o.borderColor, t)!,
    coreWidth: lerpDouble(coreWidth, o.coreWidth, t)!,
    coreColor: Color.lerp(coreColor, o.coreColor, t)!,
    haloSpread: lerpDouble(haloSpread, o.haloSpread, t)!,
    haloOpacity: lerpDouble(haloOpacity, o.haloOpacity, t)!,
  );
}

abstract final class TripStyle {
  static const resolver = StyleResolver<TripLook>(_lookOf);

  static TripLook _lookOf(MapObjectVisualState s) => switch (s) {
    // hovered et dragging gardent l'apparence normale, comme avant.
    MapObjectVisualState.normal ||
    MapObjectVisualState.hovered ||
    MapObjectVisualState.dragging => const TripLook(
      borderWidth: 4.5,
      borderColor: Color(0x66000000), // noir 40 %
      coreWidth: 2.5,
      coreColor: Color(0xFF546E7A), // bleu-gris
      haloSpread: 0,
      haloOpacity: 0,
    ),
    MapObjectVisualState.selected => const TripLook(
      borderWidth: 7,
      borderColor: Color(0xFF00363A), // contour de contraste
      coreWidth: 4,
      coreColor: Color(0xFF00E5FF), // cœur vif
      haloSpread: 11,
      haloOpacity: 1,
    ),
  };

  static const _haloColor = Color(0xFF00E5FF);

  /// Opacité de chaque passe, de la plus large à la plus étroite.
  /// Trois passes translucides simulent le dégradé d'un flou.
  static const _haloAlphas = [0.10, 0.20, 0.30];
  static const _haloStep = 4.0;

  static DrawCommand build(Path path, TripLook look) {
    Stroke stroke(Color c, double w) => Stroke(
      c,
      width: max(0.0, w).px,
      cap: StrokeCap.round,
      join: StrokeJoin.round,
    );

    final outer = look.borderWidth + look.haloSpread;

    return DrawGroup([
      if (look.haloOpacity > 0.01)
        for (var i = 0; i < _haloAlphas.length; i++)
          DrawPath(
            path: path,
            style: stroke(
              _haloColor.withValues(alpha: _haloAlphas[i] * look.haloOpacity),
              outer - i * _haloStep,
            ),
          ),
      DrawPath(path: path, style: stroke(look.borderColor, look.borderWidth)),
      DrawPath(path: path, style: stroke(look.coreColor, look.coreWidth)),
    ]);
  }
}
