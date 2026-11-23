import 'dart:math';

import 'package:domain_core/domain_core.dart';

import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/map/objects/shared/badge/badge_look.dart';
import 'package:vamos_cartographie/map/objects/shared/badge/badge_style.dart';

final class WaypointItem extends PointItem {
  WaypointItem({
    required this.object,
    required this.worldPosition,
    required this.kindStyle,
    this.background = false,
  }) : zIndex = background ? ZIndex.content - 1 : ZIndex.marker;

  /// Au second plan : sous la route, presque transparent. Pour les scènes où
  /// les waypoints ne sont que du repère (sélection d'une portion de route).
  final bool background;

  /// Une copie de ce waypoint au second plan.
  WaypointItem asBackground() => WaypointItem(
    object: object,
    worldPosition: worldPosition,
    kindStyle: kindStyle,
    background: true,
  );

  /// Opacité d'un waypoint au second plan.
  static const _backgroundOpacity = 0.12;

  @override
  int zIndex;

  @override
  final MapWaypoint object;
  @override
  final WorldOffset worldPosition;

  /// Couleur et glyphe : même source que les widgets (catégorie ou halte).
  final WaypointKindStyle kindStyle;

  /// Rayon de la pastille au repos. Doit rester égal au `radius` passé à
  /// [BadgeStyle.build].
  static const _radius = 13.0;

  @override
  ScreenLength get visualRadius => _radius.px;

  @override
  ScreenLength get hitRadius => 16.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final look = BadgeStyle.resolver.resolve(context);
    return BadgeStyle.build(
      anchor: worldPosition,
      color: kindStyle.color,
      glyph: IconGlyph(kindStyle.svgPath),
      look: background
          ? BadgeLook(
              scale: look.scale,
              casing: look.casing,
              halo: look.halo,
              lift: look.lift,
              opacity: min(look.opacity, _backgroundOpacity),
            )
          : look,
      radius: _radius,
    );
  }
}
