import 'dart:ui';

import 'package:map_application/domain/map_objects.dart';
import 'package:map_application/domain/map_scene.dart';
import 'package:map_application/domain/projected_line.dart';
import 'package:map_application/domain/projected_point.dart';
import 'package:map_application/map_camera_controller.dart';

abstract class ProjectedObject {
  final MapObject object;
  const ProjectedObject(this.object);
  bool isHitAt(Offset point);
}

class ProjectedScene {
  final List<ProjectedObject> objects;

  ProjectedScene(this.objects);
}

ProjectedScene buildProjectedScene(MapScene scene, Camera camera) {
  final objects = [
    ...scene.points.map(
      (object) => ProjectedPoint(object: object, camera: camera),
    ),
    ...scene.lines.map(
      (object) => ProjectedLine(object: object, camera: camera),
    ),
  ];

  objects.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));

  return ProjectedScene(objects);
}
