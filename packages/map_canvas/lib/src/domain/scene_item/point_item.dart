part of 'scene_item.dart';

abstract class PointItem<T extends MapPoint> extends SceneItem {
  final WorldOffset worldPosition;

  PointItem({required T object, required this.worldPosition}) : super(object);

  T get point => object as T;

  double distanceTo(WorldOffset position) {
    return (position.value - worldPosition.value).distance;
  }

  @override
  bool isHitAt(WorldOffset position, double scale) {
    return distanceTo(position) <= (point.radius / scale);
  }
}
