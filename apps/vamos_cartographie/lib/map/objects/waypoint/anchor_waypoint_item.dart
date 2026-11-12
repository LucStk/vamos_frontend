import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';

import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/objects/shared/badge/badge_style.dart';
import 'package:vamos_cartographie/map/objects/waypoint/style/waypoint_style.dart';

/// Ancre, style par défaut (extrémités droites).
const anchorGlyph = IconGlyph(
  'M8.875 21.45q-1.6-.55-2.9-1.5t-2.137-2.225T3 15v-3l4 3l-1.55 1.55q.725 1.275 2.3 2.2T11 19.925V11H8V9h3V7.825q-.875-.325-1.437-1.088T9 5q0-1.25.875-2.125T12 2t2.125.875T15 5q0 .975-.562 1.738T13 7.825V9h3v2h-3v8.925q1.675-.25 3.25-1.175t2.3-2.2L17 15l4-3v3q0 1.45-.837 2.725t-2.138 2.225t-2.9 1.5T12 22t-3.125-.55M12 6q.425 0 .713-.287T13 5t-.288-.712T12 4t-.712.288T11 5t.288.713T12 6',
);

/// Ancre, variante arrondie (bords adoucis, plus lisible en petit).
const anchorRoundedGlyph = IconGlyph(
  'M8.875 21.45q-1.6-.55-2.9-1.5t-2.137-2.225T3 15v-2q0-.3.275-.45t.525.05l2.275 1.7q.35.275.387.738t-.287.787l-.725.725q.725 1.275 2.3 2.2T11 19.925V11H9q-.425 0-.712-.288T8 10t.288-.712T9 9h2V7.825q-.875-.325-1.437-1.088T9 5q0-1.25.875-2.125T12 2t2.125.875T15 5q0 .975-.562 1.738T13 7.825V9h2q.425 0 .713.288T16 10t-.288.713T15 11h-2v8.925q1.675-.25 3.25-1.175t2.3-2.2l-.725-.725q-.325-.325-.288-.787t.388-.738l2.275-1.7q.25-.2.525-.05T21 13v2q0 1.45-.838 2.725t-2.137 2.225t-2.9 1.5T12 22t-3.125-.55M12 6q.425 0 .713-.287T13 5t-.288-.712T12 4t-.712.288T11 5t.288.713T12 6',
);

final class AnchorWaypointItem extends PointItem {
  AnchorWaypointItem({
    required this.object,
    required this.worldPosition,

    required this.polyline,
    this.visualKind = WaypointVisualKind.end,
  });

  @override
  final MapWaypointAnchor object;
  @override
  final WorldOffset worldPosition;
  final WaypointVisualKind visualKind;
  final RoutePolyline polyline;

  /// Rayon du disque affiché (avant `look.scale`).
  @override
  final ScreenLength visualRadius = 9.px;

  @override
  ScreenLength get hitRadius => 14.px;
  @override
  DragDetail? dragDetail(WorldOffset p) => RouteDragDetail(polyline.project(p));

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => BadgeStyle.build(
    anchor: worldPosition,
    color: Colors.grey,
    glyph: anchorGlyph,
    look: BadgeStyle.resolver.resolve(context),
    radius: 8,
  );
}
