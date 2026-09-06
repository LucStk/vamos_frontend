// lib/hit_engine/map_hit_tester.dart
import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/editor.dart';
import 'package:map_application/hit_engine/hit_engine.dart';
import 'package:trip_application/trip_application.dart';

class HitTestThresholds {
  final double vertexRadiusPx;
  final double cursorRadiusPx;
  final double pencilRadiusPx;
  final double segmentRadiusPx;

  const HitTestThresholds({
    this.vertexRadiusPx = 24,
    this.cursorRadiusPx = 10,
    this.pencilRadiusPx = 10,
    this.segmentRadiusPx = 10,
  });
}

/// Résout l'élément touché à une position donnée, en respectant un ordre
/// de priorité entre sources (pencil, vertices, cursor, segments, sketch).
/// Ne connaît ni Flutter ni Riverpod — reçoit ses dépendances par
/// injection plutôt que par contrat d'héritage.
class MapHitTester {
  final MapMode Function() _hitMode;
  final MapElement Function() _hitSelection;
  final List<VertexFields> Function() _vertices;
  final List<SegmentFields> Function() _segments;
  final Point<double> Function(LatLng) project;
  final HitTestThresholds thresholds;

  MapHitTester({
    required MapMode Function() hitMode,
    required MapElement Function() hitSelection,
    required List<VertexFields> Function() vertices,
    required List<SegmentFields> Function() segments,
    required this.project,
    this.thresholds = const HitTestThresholds(),
  }) : _hitMode = hitMode,
       _hitSelection = hitSelection,
       _vertices = vertices,
       _segments = segments;

  MapMode get hitMode => _hitMode();
  MapElement get hitSelection => _hitSelection();
  List<VertexFields> get vertices => _vertices();
  List<SegmentFields> get segments => _segments();

  // ---------------------------------------------------------------------
  // API publique
  // ---------------------------------------------------------------------

  /// Renvoie le premier élément touché à [position], en respectant
  /// l'ordre de priorité défini par [_buildCandidates].
  /// [exclude] permet d'ignorer un élément précis (ex: l'élément en
  /// cours de drag) — la comparaison logique est déléguée à
  /// [isSameHitTarget], jamais à une égalité de valeur complète.
  MapElement hitTest(LatLng latLng, {MapElement? exclude}) {
    final position = project(latLng);
    final candidates = _buildCandidates(position);
    final match = _firstMatch(candidates, position, exclude: exclude);
    return match ?? const NoMapElement();
  }

  // ---------------------------------------------------------------------
  // Matching
  // ---------------------------------------------------------------------

  MapElement? _firstMatch(
    List<HitCandidate> candidates,
    Point<double> position, {
    MapElement? exclude,
  }) {
    for (final candidate in candidates) {
      if (_isExcluded(candidate, exclude)) continue;
      if (_isWithinRange(candidate, position)) return candidate.element;
    }
    return null;
  }

  bool _isExcluded(HitCandidate candidate, MapElement? exclude) =>
      exclude != null && isSameHitTarget(exclude, candidate.element);

  bool _isWithinRange(HitCandidate candidate, Point<double> position) =>
      candidate.distanceTo(position) <= _radius(candidate);

  double _radius(HitCandidate c) => switch (c) {
    PointCandidate(:final radiusPx) => radiusPx,
    PolylineCandidate(:final radiusPx) => radiusPx,
  };

  // ---------------------------------------------------------------------
  // Construction des candidats — un point d'entrée par source, dans
  // l'ordre de priorité voulu (le premier match gagne).
  // ---------------------------------------------------------------------

  List<HitCandidate> _buildCandidates(Point<double> position) => [
    ..._pencilCandidate(),
    ..._vertexCandidates(position),
    ..._cursorCandidate(),
    ..._polylineCandidates(position),
    ..._sketchPolylineCandidates(),
  ];

  Iterable<HitCandidate> _pencilCandidate() sync* {
    if (hitMode case SketchMode()) {
      final pencilLatLng = (hitMode as SketchMode).pencilPositionOrNull;
      if (pencilLatLng == null) return;
      yield PointCandidate(
        point: project(pencilLatLng),
        radiusPx: thresholds.pencilRadiusPx,
        element: MapSketchPencil(pencilLatLng),
      );
    }
  }

  Iterable<HitCandidate> _vertexCandidates(Point<double> position) {
    final candidates =
        _visibleVertices()
            .map(
              (v) => PointCandidate(
                point: project(v.latLng),
                radiusPx: thresholds.vertexRadiusPx,
                element: MapVertex(v),
              ),
            )
            .where((c) => _isWithinRange(c, position))
            .toList()
          ..sort(
            (a, b) => a.distanceTo(position).compareTo(b.distanceTo(position)),
          );
    return candidates;
  }

  Iterable<HitCandidate> _polylineCandidates(Point<double> position) {
    final candidates =
        segments
            .map(
              (v) => PolylineCandidate(
                projectedPoints: v.geometry.map((l) => project(l)).toList(),
                radiusPx: thresholds.segmentRadiusPx,
                element: MapSegment(v),
              ),
            )
            .where((c) => _isWithinRange(c, position))
            .toList()
          ..sort(
            (a, b) => a.distanceTo(position).compareTo(b.distanceTo(position)),
          );
    return candidates;
  }

  Iterable<HitCandidate> _sketchPolylineCandidates() sync* {
    if (hitMode case SketchMode()) {
      final sketchSegment = (hitMode as SketchMode).sketchSegmentGeometryOrNull;
      if (sketchSegment == null) return;
      yield PolylineCandidate(
        projectedPoints: sketchSegment.map((l) => project(l)).toList(),
        radiusPx: thresholds.segmentRadiusPx,
        element: MapSketchSegment(),
      );
    }
  }

  Iterable<HitCandidate> _cursorCandidate() sync* {
    if (hitSelection case MapCursor(:final latLng)) {
      yield PointCandidate(
        point: project(latLng),
        radiusPx: thresholds.cursorRadiusPx,
        element: MapCursor(latLng),
      );
    }
  }

  /// Les vertex du mode Sketch excluent le vertex de départ du tracé
  /// (on ne peut pas re-cliquer sur son propre point d'origine).
  List<VertexFields> _visibleVertices() {
    final mode = hitMode;
    if (mode is SketchCreation) {
      return vertices.where((v) => v.id != mode.vertexStart).toList();
    }
    return vertices;
  }
}
