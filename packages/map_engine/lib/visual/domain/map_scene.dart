import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:map_engine/visual/domain/projected_scene.dart';

class MapScene {
  final ProjectedScene projectedScene;
  final MapObject? selection;

  const MapScene({required this.projectedScene, this.selection});
}

abstract interface class GestureSceneReader {
  ProjectedScene get scene;
}
