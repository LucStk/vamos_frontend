// map_application/lib/hit_engine/hit_tester.dart

import 'dart:math';
import 'package:latlong2/latlong.dart';
import 'package:map_application/hit_engine/hit_candidate.dart';
import 'package:trip_application/trip_application.dart';
import 'hit_model.dart';
import 'hit_projector.dart';

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

// map_application/lib/hit_engine/hit_tester.dart

class MapElementTester {
  final HitTestThresholds thresholds;

  const MapElementTester({this.thresholds = const HitTestThresholds()});

  MapElement resolve({
    required Point<double> position,
    required LatLngProjector project,
    required List<VertexFields> vertices,
    LatLng? cursorLatLng,
    LatLng? pencilLatLng,
    MapElement? segmentHit,
    MapElement? sketchHit,
    MapElement? elementExclude,
  }) {
    // dans MapElementTester
    final candidates = _buildCandidates(
      position: position,
      project: project,
      vertices: vertices,
      cursorLatLng: cursorLatLng,
      pencilLatLng: pencilLatLng,
      segmentHit: segmentHit,
      sketchHit: sketchHit,
    );

    for (final candidate in candidates) {
      if (elementExclude != null &&
          isSameHitTarget(elementExclude, candidate.element)) {
        continue;
      }
      if (candidate.distanceTo(position) <= _radius(candidate)) {
        return candidate.element;
      }
    }

    return const NoMapElement();
  }

  List<HitCandidate> _buildCandidates({
    required Point<double> position,
    required LatLngProjector project,
    required List<VertexFields> vertices,
    LatLng? cursorLatLng,
    LatLng? pencilLatLng,
    MapElement? segmentHit,
    MapElement? sketchHit,
  }) {
    final result = <HitCandidate>[];

    // 1. Pencil (priorité max)
    if (pencilLatLng != null) {
      result.add(
        PointCandidate(
          point: project(pencilLatLng),
          radiusPx: thresholds.pencilRadiusPx,
          element: MapSketchPencil(pencilLatLng),
        ),
      );
    }

    // 2. Vertices (triés par distance)
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

    // 3. Cursor
    if (cursorLatLng != null) {
      result.add(
        PointCandidate(
          point: project(cursorLatLng),
          radiusPx: thresholds.cursorRadiusPx,
          element: MapCursor(),
        ),
      );
    }

    // 4. Segments (layer hit, pas de rayon)
    if (segmentHit != null) result.add(LayerCandidate(segmentHit));
    if (sketchHit != null) result.add(LayerCandidate(sketchHit));

    return result;
  }

  double _radius(HitCandidate c) => switch (c) {
    PointCandidate(:final radiusPx) => radiusPx,
    LayerCandidate() => double.infinity,
  };
}
