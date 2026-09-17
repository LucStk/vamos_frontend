part of 'projected_object.dart';

abstract class ProjectedPoint<T extends MapPoint> extends ProjectedObject {
  final WorldOffset worldPosition;

  ProjectedPoint({required T object, required this.worldPosition})
    : super(object);

  T get point => object as T;

  double distanceTo(WorldOffset position) {
    return (position.value - worldPosition.value).distance;
  }

  @override
  bool isHitAt(WorldOffset position, double scale) {
    return distanceTo(position) <= (point.radius / scale);
  }
}
