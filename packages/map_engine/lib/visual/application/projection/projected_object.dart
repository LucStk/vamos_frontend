import 'dart:ui';

import 'package:map_engine/utiles/segment_hit_helpers.dart';
import 'package:map_engine/visual/visual.dart';

part "projected_line.dart";
part "projected_point.dart";
part "projected_user_location.dart";
part "projected_vertex.dart";
part "projected_segment.dart";
part "projected_sketch_pencil.dart";
part "projected_sketch_segment.dart";

abstract class ProjectedObject {
  final MapObject object;

  const ProjectedObject(this.object);

  bool isHitAt(WorldOffset point, double scale);

  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  });
}
