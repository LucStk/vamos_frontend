// map_canvas/lib/src/domain/icon/icon_glyph.dart
import 'dart:ui';

/// Un pictogramme décrit par les données `d` d'un `<path>` SVG.
///
/// Contrat : viewBox carré, pas de `transform`, remplissage ou trait uniforme.
final class IconGlyph {
  const IconGlyph(
    this.d, {
    this.viewBox = const Rect.fromLTWH(0, 0, 24, 24),
    this.paint = const GlyphFill(),
    this.fillType = PathFillType.nonZero,
  });

  final String d;
  final Rect viewBox;
  final GlyphPaint paint;
  final PathFillType fillType;
}

sealed class GlyphPaint {
  const GlyphPaint();
}

final class GlyphFill extends GlyphPaint {
  const GlyphFill();
}

final class GlyphStroke extends GlyphPaint {
  /// Épaisseur exprimée dans l'unité du viewBox (2 pour Lucide sur 24).
  const GlyphStroke({this.width = 2});
  final double width;
}
