import 'package:domain_core/domain_core.dart';
import 'package:flutter/painting.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/appearance/selection_handle_shape.dart';

final class RouteHandleItem extends PointItem {
  RouteHandleItem({
    required this.object,
    required this.polyline,
    required this.position,
  });

  @override
  final RouteHandle object;
  final RoutePolyline polyline;
  final double position;

  @override
  late final WorldOffset worldPosition = polyline.pointAt(position);
  late final double angle = polyline.angleAt(position);
  late final Path _path = SelectionHandleShape.drop(angle: angle);
  late final Offset _center = SelectionHandleShape.bodyCenter(angle);

  @override
  DragDetail? dragDetail(WorldOffset p) => RouteDragDetail(polyline.project(p));

  static const _color = Color(0xFF1565C0);

  @override
  int zIndex = ZIndex.handle;

  @override
  ScreenLength get visualRadius => 12.px;
  @override
  ScreenLength get hitRadius => 16.px;

  static const _hitPadding = 6.0; // marge pour le doigt, en px

  @override
  bool isHitAt(WorldOffset p, double zoomScale) {
    final d = (p.value - worldPosition.value) * zoomScale; // px écran
    return _path.contains(d) ||
        (d - _center).distance <= SelectionHandleShape.radius + _hitPadding;
  }

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => DrawAnchoredPath(
    anchor: worldPosition,
    path: _path, // le même chemin que celui du hit
    style: const Fill(_color),
  );
}
