import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/endpoint_style.dart';

final class TripStartItem<T extends MapRouteOrigin> extends PointItem {
  TripStartItem({
    required this.object,
    required this.worldPosition,
    this.polyline,
  });

  @override
  final T object;

  /// Route du trip. Absente pour une origine sans route (`MapTmpOrigin`).
  final RoutePolyline? polyline;

  @override
  final WorldOffset worldPosition;

  @override
  ScreenLength get visualRadius => 12.px;
  @override
  ScreenLength get hitRadius => 16.px;

  /// Le départ est la position 0 de la route.
  @override
  HitDetail? hitDetail(WorldOffset p) =>
      polyline == null ? null : const RouteHitDetail(0);

  @override
  DragDetail? dragDetail(WorldOffset p) {
    final polyline = this.polyline;
    return polyline == null ? null : RouteDragDetail(polyline.project(p));
  }

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => EndpointStyle.start(worldPosition);
}
