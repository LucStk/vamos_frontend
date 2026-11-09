import 'package:domain_core/domain_core.dart';
import 'package:flutter/painting.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/appearance/selection_handle_shape.dart';

final class SelectionHandleItem extends PointItem {
  SelectionHandleItem({
    required this.position,
    required this.object,
    required this.polyline,
    required this.min,
    required this.max,
  });

  final RoutePolyline polyline;
  final double min; // borne basse du déplacement (position continue)
  final double max;

  @override
  DragDetail? dragDetail(WorldOffset p) =>
      RouteDragDetail(polyline.project(p, min: min, max: max));

  @override
  final SelectionHandle object;
  final double position;

  @override
  WorldOffset get worldPosition => polyline.pointAt(position);

  double get angle => polyline.angleAt(position);

  static const _color = Color(0xFF1565C0);

  @override
  ScreenLength get visualRadius => 12.px;
  @override
  ScreenLength get hitRadius => 16.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => DrawAnchoredPath(
    anchor: worldPosition,
    path: SelectionHandleShape.halfDrop(object.side, angle: angle),
    style: const Fill(_color),
  );
}
