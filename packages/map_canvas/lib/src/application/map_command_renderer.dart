import 'dart:math';
import 'dart:ui';

import '../domain/draw_command.dart';
import '../domain/draw_space.dart';

final class MapCommandRenderer {
  const MapCommandRenderer({
    required this.canvas,
    required this.activeSpace,
    this.zoomScale = 1.0,
  });

  /// zoomScale (px par unité monde) auquel world et screen ont la même taille.
  /// À régler : debugPrint(camera.zoomScale) au zoom voulu.
  static const referenceZoomScale = 0.5;

  final Canvas canvas;
  final DrawSpace activeSpace; // couche en cours de rendu
  final double zoomScale; // utilisé uniquement par la couche screen

  void paintAll(Iterable<DrawCommand> commands, {required DrawSpace space}) {
    for (final c in commands) {
      paint(c, space: space);
    }
  }

  void paint(DrawCommand command, {DrawSpace space = DrawSpace.world}) {
    switch (command) {
      case DrawGroup(space: final groupSpace, :final commands):
        paintAll(commands, space: groupSpace ?? space); // hérite si null
      case DrawTransform():
        _paintTransform(command, space: space);
      case DrawCircle():
        if (space == activeSpace) _paintCircle(command, space);
      case DrawPath():
        if (space == activeSpace) _paintPath(command, space);
    }
  }

  /// Facteur qui convertit une dimension en pixels vers des unités monde.
  double _pxToWorld(DrawUnit unit, DrawSpace space) {
    if (unit == DrawUnit.world) return 1.0;
    return switch (space) {
      DrawSpace.screen => 1 / zoomScale,
      DrawSpace.world => 1 / referenceZoomScale,
    };
  }

  void _paintCircle(DrawCircle c, DrawSpace space) {
    final k = _pxToWorld(c.unit, space);

    if (k == 1.0) {
      canvas.drawCircle(c.center.value, c.radius, c.paint);
      return;
    }

    // On dessine en coordonnées locales, mises à l'échelle : le rayon
    // et l'épaisseur du trait sont convertis ensemble.
    canvas.save();
    canvas.translate(c.center.value.dx, c.center.value.dy);
    canvas.scale(k);
    canvas.drawCircle(Offset.zero, c.radius, c.paint);
    canvas.restore();
  }

  void _paintPath(DrawPath c, DrawSpace space) {
    final k = _pxToWorld(c.unit, space);
    final p = c.paint;

    var path = c.path;
    final dash = c.dash;
    if (dash != null && dash.isNotEmpty) {
      path = _dashed(path, [for (final d in dash) d * k]);
    }

    if (k != 1.0 && p.style == PaintingStyle.stroke && p.strokeWidth != 0.0) {
      canvas.drawPath(path, Paint.from(p)..strokeWidth = p.strokeWidth * k);
    } else {
      canvas.drawPath(path, p);
    }
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

  void _paintTransform(DrawTransform command, {required DrawSpace space}) {
    final transform = command.transform;

    canvas.save();

    final origin = transform.origin.value;

    canvas.translate(origin.dx, origin.dy);

    if (transform.rotation != 0.0) {
      canvas.rotate(transform.rotation);
    }

    if (transform.scale != 1.0) {
      canvas.scale(transform.scale);
    }

    canvas.translate(-origin.dx, -origin.dy);

    if (transform.translation != Offset.zero) {
      canvas.translate(transform.translation.dx, transform.translation.dy);
    }

    // Le Transform ne change pas le scope :
    // ses enfants héritent de World ou Screen.
    paintAll(command.commands, space: space);

    canvas.restore();
  }
}
