// objects/segment/badge/mobility_badge_style.dart
import 'dart:ui';

import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/objects/segment/appearance/segment_appearance.dart';
import 'package:vamos_cartographie/map/objects/segment/badge/badge_look.dart';

/// Valeurs interpolables de la pastille dans un état donné.
///
/// Distinct de `SegmentLook` : `widthScale` s'applique à une épaisseur de
/// trait, pas à un rayon — le réutiliser ferait une pastille énorme à la
/// sélection.
abstract final class MobilityBadgeStyle {
  static const resolver = StyleResolver<BadgeLook>(_lookOf);

  static BadgeLook _lookOf(MapObjectVisualState s) => switch (s) {
    MapObjectVisualState.normal => const BadgeLook(
      scale: 1.0,
      casing: 1.5,
      halo: 0,
      lift: 0,
    ),
    MapObjectVisualState.hovered => const BadgeLook(
      scale: 1.12,
      casing: 1.5,
      halo: 5,
      lift: 0.15,
    ),
    MapObjectVisualState.selected => const BadgeLook(
      scale: 1.2,
      casing: 2,
      halo: 12,
      lift: 0,
    ),
    MapObjectVisualState.dragging => const BadgeLook(
      scale: 1.15,
      casing: 2,
      halo: 16,
      lift: 0.2,
    ),
  };

  static const _casingColor = Color(0xD9FFFFFF); // blanc ~85 %
  static const _white = Color(0xFFFFFFFF);

  /// Rayon de la pastille au repos (px). Doit rester égal à
  /// `MobilityBadgeItem.visualRadius`.
  static const _radius = 11.0;

  /// Côté du glyphe au repos (px).
  static const _glyph = 13.0;

  static DrawCommand build(
    WorldOffset anchor,
    SegmentAppearance a,
    IconGlyph glyph,
    BadgeLook look,
  ) {
    final r = _radius * look.scale;
    final fill = Color.lerp(a.color, _white, look.lift)!;

    // Arrondi : sans lui, chaque frame d'animation crée une entrée de cache
    // distincte dans GlyphPaths et le chemin est reparsé à 60 Hz.
    final glyphPx = (_glyph * look.scale).roundToDouble();

    return DrawGroup([
      if (look.halo > 0.1)
        DrawCircle(
          center: anchor,
          radius: (r + look.halo / 2).px,
          style: Fill(a.color.withValues(alpha: 0.30)),
        ),
      DrawCircle(center: anchor, radius: r.px, style: Fill(_casingColor)),
      DrawCircle(
        center: anchor,
        radius: (r - look.casing).px,
        style: Fill(fill),
      ),
      DrawAnchoredPath(
        anchor: anchor,
        path: GlyphPaths.centered(glyph, sizePx: glyphPx),
        style: _glyphStyle(glyph, _white, sizePx: glyphPx),
      ),
    ]);
  }

  /// Rempli ou tracé selon le pack d'icônes. L'épaisseur du trait suit la
  /// même échelle que la géométrie, sinon un glyphe réduit a un trait
  /// plusieurs fois trop épais.
  static PaintSpec _glyphStyle(
    IconGlyph g,
    Color color, {
    required double sizePx,
  }) => switch (g.paint) {
    GlyphFill() => Fill(color),
    GlyphStroke(:final width) => Stroke(
      color,
      width: (width * sizePx / g.viewBox.width).px,
      cap: StrokeCap.round,
      join: StrokeJoin.round,
    ),
  };
}
