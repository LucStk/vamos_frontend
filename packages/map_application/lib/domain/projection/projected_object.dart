import 'dart:ui';

import 'package:map_application/domain/domain.dart';
import 'package:map_application/domain/projection/helpers/segment_hit_helpers.dart';
import 'package:map_application/map_camera_controller.dart';

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

  bool isHitAt(Offset point);

  void paint(
    Canvas canvas, {
    MapPaintContext context = const MapPaintContext(),
  });
}
