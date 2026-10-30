import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/src/domain/map_paint_context.dart';
import 'package:map_canvas/src/domain/scene_item/scene_item.dart';
import 'package:map_engine/map_engine.dart';

typedef VisualStateResolver = MapObjectVisualState Function(MapObject);

typedef MapObjectPredicate = bool Function(MapObject);

class MapScene {
  const MapScene({
    required this.items,
    this.selection,
    this.hovered,
    this.dragging,
  });

  final List<SceneItem> items;
  final Selectable? selection;
  final MapObject? hovered;
  final MapObject? dragging;

  MapHit? hitTest(
    WorldOffset worldPosition,
    double scale, {
    MapObject? exclude,
    bool dropTargetsOnly = false,
  }) {
    for (final candidate in items) {
      if (!candidate.isHitTestable) continue;
      if (dropTargetsOnly && !candidate.isDropTarget) continue;
      if (candidate.object == exclude) continue;

      if (candidate.isHitAt(worldPosition, scale)) {
        return MapHit(
          object: candidate.object,
          point: candidate.hitPoint(worldPosition),
        );
      }
    }
    return null;
  }

  MapObjectVisualState visualStateOf(MapObject object) {
    if (dragging != null && dragging! == object) {
      return MapObjectVisualState.dragging;
    }
    if (selection != null && selection! == object) {
      return MapObjectVisualState.selected;
    }
    if (hovered != null && hovered! == object) {
      return MapObjectVisualState.hovered;
    }
    return MapObjectVisualState.normal;
  }
}
