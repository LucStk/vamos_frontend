import 'dart:ui';

import 'package:domain_core/domain_core.dart';

import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/objects/shared/badge/badge_style.dart';

/// Maillon (Lucide « link », tracé en trait) : le tracé s'attache à la route.
const _attachGlyph = IconGlyph(
  'M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71'
  'M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71',
  paint: GlyphStroke(width: 2.5),
);

/// Pointe du tracé, une fois accrochée à un élément de la route.
final class PencilAnchoreItem extends PointItem {
  PencilAnchoreItem({required this.worldPosition});

  @override
  final MapSketchPencil object = MapSketchPencil();
  @override
  final WorldOffset worldPosition;

  static const _color = Color(0xFF1E88E5);

  /// Doit rester égal au rayon passé à [BadgeStyle.build].
  @override
  ScreenLength get visualRadius => BadgeStyle.defaultRadius.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => BadgeStyle.build(
    anchor: worldPosition,
    color: _color,
    glyph: _attachGlyph,
    look: BadgeStyle.resolver.resolve(context),
  );
}
