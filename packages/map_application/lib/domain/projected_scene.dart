import 'dart:ui';
import 'package:map_application/domain/map_objects.dart';

abstract class ProjectedObject {
  final MapObject object;
  const ProjectedObject(this.object);
  bool isHitAt(Offset point);
}

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
