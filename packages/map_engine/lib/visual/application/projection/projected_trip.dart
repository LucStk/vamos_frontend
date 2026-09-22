part of 'projected_object.dart';

final class ProjectedTrip extends ProjectedLine<MapTripObject> {
  ProjectedTrip({required super.object, required super.worldPoints});

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final path = this.path;
    if (path == null) {
      return const [];
    }

    final isSelected = context.state == MapObjectVisualState.selected;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 0.02 : 0.01
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    return <MapDrawCommand>[DrawPath(path: path, paint: paint)];
  }
}
