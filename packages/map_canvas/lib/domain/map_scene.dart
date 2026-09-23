import 'package:map_canvas/domain/domain.dart';
import 'package:map_engine/map_engine.dart';

typedef VisualStateResolver = MapObjectVisualState Function(MapObject);

typedef MapObjectPredicate = bool Function(MapObject);

class MapScene {
  const MapScene({required this.objects, this.selection});

  final List<ProjectedObject> objects;
  final MapObject? selection;

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

  // Iterable<MapDrawCommand> commands() sync* {
  //   for (final object in objects.reversed) {
  //     final isSelected =
  //         selection != null && object.object.isSameAs(selection!);

  //     yield object.describe(
  //       context: MapPaintContext(
  //         state: isSelected
  //             ? MapObjectVisualState.selected
  //             : MapObjectVisualState.normal,
  //       ),
  //     );
  //   }
  // }
}
