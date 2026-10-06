import 'package:map_engine/map_engine.dart';

import '../domain/map_paint_context.dart';
import 'projected_object.dart';

typedef VisualStateResolver = MapObjectVisualState Function(MapObject);

typedef MapObjectPredicate = bool Function(MapObject);

class MapScene {
  const MapScene({
    required this.objects,
    this.selection,
    this.hovered,
    this.dragging,
  });

  final List<ProjectedObject> objects;
  final MapObject? selection;
  final MapObject? hovered;
  final MapObject? dragging;

  MapObject? hitTest(
    WorldOffset worldPosition,
    double scale, {
    MapObjectPredicate? ignore,
  }) {
    for (final candidate in objects) {
      if (ignore?.call(candidate.object) ?? false) {
        continue;
      }

      if (candidate.isHitAt(worldPosition, scale)) {
        return candidate.object;
      }
    }

    return null;
  }

  MapObjectVisualState visualStateOf(MapObject object) {
    if (dragging != null && dragging!.isSameAs(object)) {
      return MapObjectVisualState.dragging;
    }
    if (selection != null && selection!.isSameAs(object)) {
      return MapObjectVisualState.selected;
    }
    if (hovered != null && hovered!.isSameAs(object)) {
      return MapObjectVisualState.hovered;
    }
    return MapObjectVisualState.normal;
  }
}
