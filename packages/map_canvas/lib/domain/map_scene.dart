import 'package:map_engine/domain/domain.dart';

class MapScene {
  final ProjectedScene projectedScene;
  final MapObject? selection;

  const MapScene({required this.projectedScene, this.selection});
}
