import 'dart:ui';

import 'package:map_application/domain/map_objects.dart';
import 'package:map_application/domain/projection/projected_object.dart';

class ProjectedScene {
  final List<ProjectedObject> objects;

  ProjectedScene(this.objects);

  MapObject? hitTest(Offset point, {MapObject? exclude}) {
    for (final candidate in objects) {
      if (exclude != null && exclude.isSameAs(candidate.object)) {
        continue;
      }

      if (candidate.isHitAt(point)) {
        return candidate.object;
      }
    }

    return null;
  }
}
