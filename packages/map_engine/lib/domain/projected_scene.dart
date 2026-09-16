import 'dart:ui';

import 'package:map_engine/domain/map_objects.dart';
import 'package:map_engine/draw_command/draw_command.dart';
import 'package:map_engine/projection/projection.dart';

class ProjectedScene {
  final List<ProjectedObject> objects;

  ProjectedScene(this.objects);

  MapObject? hitTest(Offset point, double scale, {MapObject? exclude}) {
    for (final candidate in objects) {
      if (exclude != null && exclude.isSameAs(candidate.object)) {
        continue;
      }

      if (candidate.isHitAt(point, scale)) {
        return candidate.object;
      }
    }

    return null;
  }

  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final l = [
      for (final object in objects) ...object.describe(context: context),
    ];
    return l.reversed.toList();
  }
}
