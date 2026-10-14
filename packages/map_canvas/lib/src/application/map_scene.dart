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

  MapObject? hitTest(
    WorldOffset worldPosition,
    double scale, {
    MapObjectPredicate? ignore,
  }) {
    for (final candidate in items) {
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
