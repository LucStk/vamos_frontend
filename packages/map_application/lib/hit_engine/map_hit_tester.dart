// lib/hit_engine/map_hit_tester.dart
import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/editor.dart';
import 'package:map_application/hit_engine/hit_candidate.dart';
import 'package:trip_application/trip_application.dart';

class HitTestThresholds {
  final double vertexRadiusPx;
  final double cursorRadiusPx;
  final double pencilRadiusPx;

  const HitTestThresholds({
    this.vertexRadiusPx = 24,
    this.cursorRadiusPx = 10,
    this.pencilRadiusPx = 10,
  });
}

mixin MapHitTester {
  // Abstractions pures — pas de Flutter, pas de Riverpod
  MapMode get hitMode;
  MapSelection get hitSelection;
  List<VertexFields> get hitVertices;
  MapElement? get segmentHit;
  MapElement? get sketchHit;
  Point<double> Function(LatLng) get project;

  HitTestThresholds get thresholds => const HitTestThresholds();

  MapElement hitTest(Point<double> position, {MapElement? exclude}) {
    final filteredVertices = _filterVertices();
    final candidates = _buildCandidates(position, filteredVertices);

    for (final candidate in candidates) {
      if (exclude != null && isSameHitTarget(exclude, candidate.element)) {
        continue;
      }
      if (candidate.distanceTo(position) <= _radius(candidate)) {
        return candidate.element;
      }
    }
    return const NoMapElement();
  }

  List<VertexFields> _filterVertices() {
    final mode = hitMode;
    if (mode is Sketch) {
      return hitVertices.where((v) => v.id != mode.vertexStart).toList();
    }
    return hitVertices;
  }

  List<HitCandidate> _buildCandidates(
    Point<double> position,
    List<VertexFields> vertices,
  ) {
    final result = <HitCandidate>[];
    final pencilLatLng = hitMode.pencilPositionOrNull;
    final cursorLatLng = hitSelection.cursorLatLngOrNull;

    if (pencilLatLng != null) {
      result.add(
        PointCandidate(
          point: project(pencilLatLng),
          radiusPx: thresholds.pencilRadiusPx,
          element: MapSketchPencil(pencilLatLng),
        ),
      );
    }

    final vertexCandidates =
        vertices
            .map(
              (v) => PointCandidate(
                point: project(v.latLng),
                radiusPx: thresholds.vertexRadiusPx,
                element: MapVertex(v),
              ),
            )
            .where((c) => c.distanceTo(position) <= thresholds.vertexRadiusPx)
            .toList()
          ..sort(
            (a, b) => a.distanceTo(position).compareTo(b.distanceTo(position)),
          );
    result.addAll(vertexCandidates);

    if (cursorLatLng != null) {
      result.add(
        PointCandidate(
          point: project(cursorLatLng),
          radiusPx: thresholds.cursorRadiusPx,
          element: MapCursor(),
        ),
      );
    }

    if (segmentHit != null) result.add(LayerCandidate(segmentHit!));
    if (sketchHit != null) result.add(LayerCandidate(sketchHit!));

    return result;
  }

  double _radius(HitCandidate c) => switch (c) {
    PointCandidate(:final radiusPx) => radiusPx,
    LayerCandidate() => double.infinity,
  };
}
