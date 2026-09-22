import 'dart:ui';

import 'package:map_engine/utiles/segment_hit_helpers.dart';
import 'package:map_engine/visual/visual.dart';

part "projected_line.dart";
part "projected_point.dart";
part "projected_polyline.dart";

abstract class ProjectedObject {
  final MapObject object;

  const ProjectedObject(this.object);

  bool isHitAt(WorldOffset point, double scale);

  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  });
}
