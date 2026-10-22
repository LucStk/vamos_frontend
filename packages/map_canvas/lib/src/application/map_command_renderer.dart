import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import '../domain/draw_command.dart';
import '../domain/length.dart';
import '../domain/paint_spec.dart';

final class MapCommandRenderer {
  /// Passe invariante au zoom : ne dessine que les commandes en WorldLength.
  /// Pas de zoomScale, donc impossible de convertir un ScreenLength par erreur.
  MapCommandRenderer.zoomInvariant(this.canvas) : zoomScale = null;

  /// Passe dépendante du zoom : ne dessine que les commandes contenant un ScreenLength.
  MapCommandRenderer.zoomDependent(
    this.canvas, {
    required double this.zoomScale,
  });

  final Canvas canvas;
  final double? zoomScale; // null = passe invariante
  bool get _dependentPass => zoomScale != null;
  final Paint _paint = Paint();

  void paintAll(Iterable<DrawCommand> commands) {
    for (final c in commands) {
      paint(c, inheritedDependent: false);
    }
  }

  void paint(DrawCommand c, {required bool inheritedDependent}) {
    switch (c) {
      case DrawGroup():
        for (final child in c.commands) {
          paint(child, inheritedDependent: inheritedDependent);
        }
      case DrawTransform():
        _paintTransform(c, inheritedDependent: inheritedDependent);
      case DrawCircle():
        if (_belongs(c.dependsOnZoom || inheritedDependent)) _paintCircle(c);
      case DrawPath():
        if (_belongs(c.dependsOnZoom || inheritedDependent)) _paintPath(c);
      case DrawAnchoredPath():
        if (_dependentPass) _paintAnchoredPath(c);
    }
  }

  bool _belongs(bool dependsOnZoom) => dependsOnZoom == _dependentPass;

  double _toWorld(Length l) => switch (l) {
    ScreenLength(:final value) => value / zoomScale!,
    WorldLength(:final value) => value,
  };

  void _paintTransform(DrawTransform c, {required bool inheritedDependent}) {
    // Une translation en px rend tout le sous-arbre dépendant du zoom.
    final dependent =
        inheritedDependent || c.transform.translation.dependsOnZoom;
    if (dependent && !_dependentPass) return; // rien à dessiner ici

    final t = c.transform;
    final origin = t.origin.value;
    canvas.save();
    canvas.translate(origin.dx, origin.dy);
    if (t.rotation != 0.0) canvas.rotate(t.rotation);
    if (t.scale != 1.0) canvas.scale(t.scale);
    canvas.translate(-origin.dx, -origin.dy);
    final dx = _toWorld(t.translation.dx), dy = _toWorld(t.translation.dy);
    if (dx != 0.0 || dy != 0.0) canvas.translate(dx, dy);
    for (final child in c.commands) {
      paint(child, inheritedDependent: dependent);
    }
    canvas.restore();
  }

  // _paintCircle, _paintPath, _paintOf, _dashed : inchangés

  Paint _paintOf(PaintSpec spec) {
    _paint.color = spec.color;
    switch (spec) {
      case Fill():
        _paint.style = PaintingStyle.fill;
      case Stroke(:final width, :final cap, :final join):
        _paint
          ..style = PaintingStyle.stroke
          ..strokeWidth = _toWorld(width)
          ..strokeCap = cap
          ..strokeJoin = join;
    }
    return _paint;
  }

  void _paintCircle(DrawCircle c) {
    canvas.drawCircle(c.center.value, _toWorld(c.radius), _paintOf(c.style));
  }

  void _paintPath(DrawPath c) {
    var path = c.path;
    if (c.style case Stroke(:final dash?) when dash.isNotEmpty) {
      path = _dashed(path, [for (final d in dash) _toWorld(d)]);
    }
    canvas.drawPath(path, _paintOf(c.style));
  }

  void _paintAnchoredPath(DrawAnchoredPath c) {
    final s = 1.0 / zoomScale!;
    final a = c.anchor.value;
    // Échelle 1/zoom + translation vers l'ancre (matrice 4x4 colonne-major).
    final m = Float64List.fromList([
      s,
      0,
      0,
      0,
      0,
      s,
      0,
      0,
      0,
      0,
      1,
      0,
      a.dx,
      a.dy,
      0,
      1,
    ]);
    _paintPath(DrawPath(path: c.path.transform(m), style: c.style));
  }

  static Path _dashed(Path source, List<double> pattern) {
    final out = Path();
    for (final metric in source.computeMetrics()) {
      var distance = 0.0;
      var i = 0;
      while (distance < metric.length) {
        final len = pattern[i % pattern.length];
        if (i.isEven) {
          out.addPath(
            metric.extractPath(distance, min(distance + len, metric.length)),
            Offset.zero,
          );
        }
        distance += len;
        i++;
      }
    }
    return out;
  }
}
