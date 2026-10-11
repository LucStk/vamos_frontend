import 'dart:ui';
import 'package:map_engine/map_engine.dart';

import '../../../map_canvas.dart';
import '../draw_command.dart';
import '../length.dart';

part "line_item.dart";
part "point_item.dart";
part "polyline_item.dart";

abstract class SceneItem {
  // const SceneItem(this.object, {required this.hitRadius, this.hitPriority = 0});
  MapObject get object;
  Length get hitRadius;
  Length get visualRadius;
  int hitPriority = 0;

  bool isHitAt(WorldOffset p, double zoomScale);

  DrawCommand toDrawCommand({MapPaintContext context});
}
