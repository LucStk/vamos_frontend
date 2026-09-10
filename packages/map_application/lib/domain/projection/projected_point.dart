part of 'projected_object.dart';

abstract class ProjectedPoint<T extends MapPoint> extends ProjectedObject {
  final Offset projectedPosition;

  ProjectedPoint({required T object, required Camera camera})
    : projectedPosition = camera.latLngToScreenOffset(object.position),
      super(object);

  T get point => object as T;

  double distanceTo(Offset position) {
    return (position - projectedPosition).distance;
  }

  @override
  bool isHitAt(Offset position) {
    return distanceTo(position) <= point.radius;
  }
}
