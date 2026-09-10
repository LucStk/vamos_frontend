import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/domain.dart';
import 'package:map_application/hit_engine/projected_line.dart';
import 'package:map_application/hit_engine/projected_point.dart';
import 'package:map_application/map_application.dart';
import 'package:map_application/map_camera_controller.dart';

abstract class ProjectedObject {
  final MapObject object;
  const ProjectedObject(this.object);
  bool isHitAt(Point<double> point);
}

class BuiltHitScene {
  final List<ProjectedObject> candidates;

  BuiltHitScene(MapScene scene, MapCameraController camera)
    : candidates = [
        ...scene.points.map((o) => ProjectedPoint(object: o, camera: camera)),
        ...scene.lines.map((o) => ProjectedLine(object: o, camera: camera)),
      ]..sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
}

abstract class MapHitTester {
  BuiltHitScene get builtScene;
  MapCameraController get camera;

  MapObject? hitTest(LatLng latLng, {MapObject? exclude}) {
    // Hit Test vérifie si il y a un objet à une position donné
    // On commence par trouver la position du point sur l'écran
    final position = camera.latLngToPoint(latLng);

    for (final candidate in builtScene.candidates) {
      if (exclude != null && exclude.isSameAs(candidate.object)) continue;
      if (candidate.isHitAt(position)) {
        return candidate.object;
      }
    }
    return null;
  }
}
