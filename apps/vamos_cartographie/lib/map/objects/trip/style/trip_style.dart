import 'dart:math';
import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';

final class TripLook implements Lerpable<TripLook> {
  const TripLook({
    required this.borderColor,
    required this.coreColor,
    required this.widthScale,
    required this.haloSpread,
    required this.haloOpacity,
  });

  final Color borderColor, coreColor;

  /// Multiplicateur appliqué à la largeur de base (`visualRadius * 2`).
  final double widthScale;

  /// Largeur ajoutée par le halo au-delà du contour (px).
  final double haloSpread;

  /// 0 = pas de halo, 1 = halo complet.
  final double haloOpacity;

  @override
  TripLook lerp(TripLook o, double t) => TripLook(
    borderColor: Color.lerp(borderColor, o.borderColor, t)!,
    coreColor: Color.lerp(coreColor, o.coreColor, t)!,
    widthScale: lerpDouble(widthScale, o.widthScale, t)!,
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
      borderColor: Color(0x66000000), // noir 40 %
      coreColor: Color(0xFF546E7A), // bleu-gris
      widthScale: 1.0,
      haloSpread: 0,
      haloOpacity: 0,
    ),
    MapObjectVisualState.selected => const TripLook(
      borderColor: Color(0xFF00363A), // contour de contraste
      coreColor: Color(0xFF00E5FF), // cœur vif
      widthScale: 1.6,
      haloSpread: 11,
      haloOpacity: 1,
    ),
  };

  static const _haloColor = Color(0xFF00E5FF);

  /// Le cœur fait ce ratio de la largeur du contour (2.5 / 4.5).
  static const _coreRatio = 2.5 / 4.5;

  /// Opacité de chaque passe, de la plus large à la plus étroite.
  /// Trois passes translucides simulent le dégradé d'un flou.
  static const _haloAlphas = [0.10, 0.20, 0.30];
  static const _haloStep = 4.0;

  static DrawCommand build(
    Path path,
    TripLook look, {
    required ScreenLength radius,
  }) {
    Stroke stroke(Color c, double w) => Stroke(
      c,
      width: max(0.0, w).px,
      cap: StrokeCap.round,
      join: StrokeJoin.round,
    );

    final borderWidth = radius.value * 2 * look.widthScale;
    final coreWidth = borderWidth * _coreRatio;
    final outer = borderWidth + look.haloSpread;

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
      DrawPath(path: path, style: stroke(look.borderColor, borderWidth)),
      DrawPath(path: path, style: stroke(look.coreColor, coreWidth)),
    ]);
  }
}
