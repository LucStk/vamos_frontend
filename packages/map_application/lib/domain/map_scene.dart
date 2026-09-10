import 'package:map_application/domain/map_objects.dart';

class MapScene {
  final List<MapPoint> points;
  final List<MapLine> lines;

  const MapScene({this.points = const [], this.lines = const []});
}
