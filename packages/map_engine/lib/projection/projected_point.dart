part of 'projected_object.dart';

abstract class ProjectedPoint<T extends MapPoint> extends ProjectedObject {
  final Offset projectedPosition;

  ProjectedPoint({required T object, required this.projectedPosition})
    : super(object);

  T get point => object as T;

  double distanceTo(Offset position) {
    return (position - projectedPosition).distance;
  }

  @override
  bool isHitAt(Offset position, double scale) {
    return distanceTo(position) <= (point.radius / scale);
  }
}
