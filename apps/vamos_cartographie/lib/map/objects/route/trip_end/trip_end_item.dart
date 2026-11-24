import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/endpoint_style.dart';

final class TripEndItem extends PointItem {
  TripEndItem({
    required this.object,
    required this.worldPosition,
    required this.polyline,
  });
  @override
  final MapTripEnd object;

  /// Route du trip, ou null si elle n'a pas encore deux points.
  final RoutePolyline? polyline;
  @override
  final WorldOffset worldPosition;

  @override
  ScreenLength get visualRadius => 12.px;
  @override
  ScreenLength get hitRadius => 16.px;

  /// L'arrivée est la dernière position de la route.
  @override
  HitDetail? hitDetail(WorldOffset p) {
    final polyline = this.polyline;
    return polyline == null ? null : RouteHitDetail(polyline.maxPosition);
  }

  @override
  DragDetail? dragDetail(WorldOffset p) {
    final polyline = this.polyline;
    return polyline == null ? null : RouteDragDetail(polyline.project(p));
  }

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => EndpointStyle.end(worldPosition);
}
