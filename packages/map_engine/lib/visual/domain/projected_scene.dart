import 'package:map_engine/visual/visual.dart';

class ProjectedScene {
  final List<ProjectedObject> objects;

  ProjectedScene(this.objects);

  MapObject? hitTest(
    WorldOffset worldPosition,
    double scale, {
    MapObject? exclude,
  }) {
    for (final candidate in objects) {
      if (exclude != null && exclude.isSameAs(candidate.object)) {
        continue;
      }

      if (candidate.isHitAt(worldPosition, scale)) {
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
