import 'package:latlong2/latlong.dart';
import 'package:map_engine/visual/domain/offset_type.dart';
import 'package:map_engine/visual/domain/world_segment.dart';

List<(T, T)> consecutivePairs<T>(List<T> points) {
  return [
    for (var i = 0; i < points.length - 1; i++) (points[i], points[i + 1]),
  ];
}

List<WorldSegment> projectLine(
  List<LatLng> points,
  WorldOffset Function(LatLng) project,
) {
  return [
    for (var i = 0; i < points.length - 1; i++)
      (project(points[i]), project(points[i + 1])),
  ];
}

List<List<WorldSegment>> projectPolyline(
  List<List<LatLng>> lines,
  WorldOffset Function(LatLng) project,
) {
  return [for (final line in lines) projectLine(line, project)];
}
