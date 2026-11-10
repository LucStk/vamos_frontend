import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/src/application/scene_elevation.dart';
import 'package:map_canvas/src/domain/scene_item/scene_item.dart';
import 'package:map_canvas/src/domain/visual_trait.dart';
import 'package:map_engine/map_engine.dart';

typedef MapObjectPredicate = bool Function(MapObject);

/// Ce qui est dessiné, et les traits visuels de chaque objet.
///
/// La scène ne sait pas *pourquoi* un objet est sélectionné, survolé ou
/// dragué : elle reçoit des traits déjà calculés, et s'en sert pour que le
/// hit-test suive le même ordre que le dessin.
class MapScene {
  const MapScene({required this.items, this.traits = const {}});

  final List<SceneItem> items;

  /// Traits par objet. Un objet absent n'a aucun trait.
  final Map<Object, Set<VisualTrait>> traits;

  /// Même ordre que le dessin : les objets actifs passent en tête de leur
  /// groupe, donc on touche ce qu'on voit au-dessus.
  HitObject? hitTest(
    WorldOffset worldPosition,
    double scale, {
    MapObject? exclude,
    bool dropTargetsOnly = false,
  }) {
    for (final candidate in elevateActive(items, _isActive)) {
      if (!candidate.isHitTestable) continue;
      if (dropTargetsOnly && !candidate.isDropTarget) continue;
      if (candidate.object == exclude) continue;

      if (candidate.isHitAt(worldPosition, scale)) {
        return HitObject(
          object: candidate.object,
          point: candidate.hitPoint(worldPosition),
          detail: candidate.hitDetail(worldPosition),
        );
      }
    }
    return null;
  }

  bool _isActive(Object key) => traits[key]?.isNotEmpty ?? false;

  DragDetail? dragDetail(MapObject dragged, WorldOffset p) {
    for (final item in items) {
      if (item.object != dragged) continue;
      final d = item.dragDetail(p);
      if (d != null) return d;
    }
    return null;
  }
}
