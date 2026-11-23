import 'package:domain_core/domain_core.dart';

import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/map/objects/shared/badge/badge_style.dart';

final class WaypointItem extends PointItem {
  WaypointItem({
    required this.object,
    required this.worldPosition,
    required this.kindStyle,
  });

  @override
  final MapWaypoint object;
  @override
  final WorldOffset worldPosition;

  /// Couleur et glyphe : même source que les widgets (catégorie ou halte).
  final WaypointKindStyle kindStyle;

  /// Rayon de la pastille au repos. Doit rester égal au `radius` passé à
  /// [BadgeStyle.build].
  static const _radius = 8.0;

  @override
  ScreenLength get visualRadius => _radius.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => BadgeStyle.build(
    anchor: worldPosition,
    color: kindStyle.color,
    glyph: IconGlyph(kindStyle.svgPath),
    look: BadgeStyle.resolver.resolve(context),
    radius: _radius,
  );
}
