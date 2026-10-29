part of 'scene_item.dart';

abstract class PointItem extends SceneItem {
  WorldOffset get worldPosition;

  @override
  WorldOffset hitPoint(WorldOffset p) => worldPosition;

  @override
  bool isHitAt(WorldOffset p, double zoomScale) =>
      (p.value - worldPosition.value).distance <= hitRadius.toWorld(zoomScale);
}
