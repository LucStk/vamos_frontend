import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'trip_style.dart';

final class TripItem extends PolylineItem<MapTripObject> {
  TripItem({required super.object, required super.worldSegments});

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => TripStyle.build(path, TripStyle.resolver.resolve(context));
}
