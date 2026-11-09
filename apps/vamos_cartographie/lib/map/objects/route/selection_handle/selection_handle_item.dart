import 'package:domain_core/domain_core.dart';
import 'package:flutter/painting.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/appearance/selection_handle_shape.dart';

final class SelectionHandleItem extends PointItem {
  SelectionHandleItem({
    required this.object,
    required this.worldPosition,
    required this.angle,
  });

  @override
  final SelectionHandle object;
  @override
  final WorldOffset worldPosition;
  final double angle;

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
    path: SelectionHandleShape.halfDrop(object.side),
    style: const Fill(_color),
  );
}
