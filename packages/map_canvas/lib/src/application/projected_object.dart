import 'dart:ui';
import 'package:map_engine/map_engine.dart';

import '../domain/draw_command_domain.dart';
import '../domain/map_paint_context.dart';

part "projected_line.dart";
part "projected_point.dart";
part "projected_polyline.dart";

abstract class ProjectedObject {
  final MapObject object;

  const ProjectedObject(this.object);

  bool isHitAt(WorldOffset point, double scale);

  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()});
}
