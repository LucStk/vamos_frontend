import 'package:map_engine/visual/visual.dart';

typedef VisualStateResolver = MapObjectVisualState Function(MapObject);
typedef MapObjectPredicate = bool Function(MapObject);

class ProjectedScene {
  final List<ProjectedObject> objects;

  const ProjectedScene(this.objects);

  MapObject? hitTest(
    WorldOffset worldPosition,
    double scale, {
    MapObjectPredicate? ignore,
  }) {
    for (final candidate in objects) {
      if (ignore?.call(candidate.object) ?? false) continue;
      if (candidate.isHitAt(worldPosition, scale)) return candidate.object;
    }
    return null;
  }

  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
    VisualStateResolver? stateOf,
  }) {
    final commands = <MapDrawCommand>[
      for (final object in objects)
        ...object.describe(
          context: MapPaintContext(
            state: stateOf?.call(object.object) ?? MapObjectVisualState.normal,
          ),
        ),
    ];
    return commands.reversed.toList();
  }
}
