import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

/// Reprend d'un item son objet et son suivi de glissement, sans rien dessiner
/// ni répondre au toucher.
///
/// Un glissement garde l'objet saisi à son départ. Quand la sélection d'une
/// portion s'ouvre depuis un jour de la route, la scène n'affiche plus les
/// jours, mais ce jour-là doit rester dans la scène : c'est lui qui donne la
/// position du doigt le long de la route.
final class DragProxyItem extends SceneItem {
  DragProxyItem(this._source);

  final SceneItem _source;

  @override
  MapObject get object => _source.object;

  @override
  Length get hitRadius => _source.hitRadius;

  @override
  Length get visualRadius => _source.visualRadius;

  @override
  bool get isHitTestable => false;

  @override
  bool isHitAt(WorldOffset p, double zoomScale) => false;

  @override
  WorldOffset hitPoint(WorldOffset p) => p;

  @override
  DragDetail? dragDetail(WorldOffset p) => _source.dragDetail(p);

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => const DrawGroup([]);
}
