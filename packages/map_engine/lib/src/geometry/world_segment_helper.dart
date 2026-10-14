import 'package:domain_core/space/offset_type.dart';
import 'package:domain_core/space/world_segment.dart';

List<(T, T)> consecutivePairs<T>(List<T> points) {
  return [
    for (var i = 0; i < points.length - 1; i++) (points[i], points[i + 1]),
  ];
}

List<WorldSegment> projectLine<T>(
  List<T> points,
  WorldOffset Function(T) project,
) {
  return [
    for (var i = 0; i < points.length - 1; i++)
      (project(points[i]), project(points[i + 1])),
  ];
}

List<List<WorldSegment>> projectPolyline<T>(
  List<List<T>> lines,
  WorldOffset Function(T) project,
) {
  return [for (final line in lines) projectLine(line, project)];
}
