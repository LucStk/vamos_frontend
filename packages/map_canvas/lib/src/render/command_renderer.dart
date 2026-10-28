import 'dart:ui';

import 'package:map_canvas/src/domain/draw_command/draw_command.dart';
import 'package:map_canvas/src/render/paint_anchored_path.dart';
import 'package:map_canvas/src/render/paint_circle.dart';
import 'package:map_canvas/src/render/paint_hatched_stroke.dart';
import 'package:map_canvas/src/render/paint_pass.dart';
import 'package:map_canvas/src/render/paint_path.dart';

/// Aiguille chaque commande vers sa fonction de dessin, selon la passe.
final class CommandRenderer {
  /// Passe invariante au zoom : ne dessine que les commandes en WorldLength.
  CommandRenderer.zoomInvariant(Canvas canvas)
    : _pass = PaintPass.invariant(canvas);

  /// Passe dépendante du zoom : ne dessine que les commandes contenant
  /// un ScreenLength.
  CommandRenderer.zoomDependent(Canvas canvas, {required double zoomScale})
    : _pass = PaintPass.dependent(canvas, zoomScale: zoomScale);

  final PaintPass _pass;

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
        if (_inPass(c.dependsOnZoom || inheritedDependent)) {
          paintCircle(_pass, c);
        }
      case DrawPath():
        if (_inPass(c.dependsOnZoom || inheritedDependent)) {
          paintPath(_pass, c);
        }
      case DrawAnchoredPath():
        if (_inPass(true)) paintAnchoredPath(_pass, c);
      case DrawHatchedStroke():
        if (_inPass(true)) paintHatchedStroke(_pass, c);
    }
  }

  /// Une commande appartient à la passe dont elle partage la dépendance au zoom.
  bool _inPass(bool dependsOnZoom) => dependsOnZoom == _pass.isDependent;

  void _paintTransform(DrawTransform c, {required bool inheritedDependent}) {
    // Une translation en px rend tout le sous-arbre dépendant du zoom.
    final dependent =
        inheritedDependent || c.transform.translation.dependsOnZoom;
    if (dependent && !_pass.isDependent) return; // rien à dessiner ici

    final canvas = _pass.canvas;
    final t = c.transform;
    final origin = t.origin.value;

    canvas.save();
    canvas.translate(origin.dx, origin.dy);
    if (t.rotation != 0.0) canvas.rotate(t.rotation);
    if (t.scale != 1.0) canvas.scale(t.scale);
    canvas.translate(-origin.dx, -origin.dy);

    final dx = _pass.toWorld(t.translation.dx);
    final dy = _pass.toWorld(t.translation.dy);
    if (dx != 0.0 || dy != 0.0) canvas.translate(dx, dy);

    for (final child in c.commands) {
      paint(child, inheritedDependent: dependent);
    }
    canvas.restore();
  }
}
