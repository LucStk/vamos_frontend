import 'dart:ui';
import 'package:map_engine/map_engine.dart';

import '../draw_command_domain.dart';
import '../map_paint_context.dart';

part "line_item.dart";
part "point_item.dart";
part "polyline_item.dart";

abstract class SceneItem {
  final MapObject object;

  const SceneItem(this.object);

  bool isHitAt(WorldOffset point, double scale);

  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()});
}
