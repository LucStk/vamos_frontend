import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/endpoint_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/endpoint_style.dart';

final class TripStartItem<T extends MapRouteOrigin> extends PointItem {
  TripStartItem({required this.object, required this.worldPosition});

  @override
  final T object;

  @override
  final WorldOffset worldPosition;

  @override
  ScreenLength get visualRadius => 12.px;
  @override
  ScreenLength get hitRadius => 16.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => EndpointStyle.build(worldPosition, EndpointAppearances.start);
}
