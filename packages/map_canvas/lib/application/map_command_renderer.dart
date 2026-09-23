import 'dart:ui';
import 'package:map_canvas/domain/domain.dart';

enum MapRenderSpace { world, screen }

final class MapCommandRenderer {
  const MapCommandRenderer({
    required this.canvas,
    required this.layer,
    this.zoomScale = 1.0,
  });

  /// zoomScale (px par unité monde) auquel world et screen ont la même taille.
  /// À régler : debugPrint(camera.zoomScale) au zoom voulu.
  static const referenceZoomScale = 0.5;

  final Canvas canvas;
  final MapRenderSpace layer; // couche en cours de rendu
  final double zoomScale; // utilisé uniquement par la couche screen

  void paintAll(
    Iterable<MapDrawCommand> commands, {
    MapRenderSpace space = MapRenderSpace.world,
  }) {
    for (final c in commands) {
      paint(c, space: space);
    }
  }

  void paint(
    MapDrawCommand command, {
    MapRenderSpace space = MapRenderSpace.world,
  }) {
    switch (command) {
      case WorldScale():
        paintAll(command.commands, space: MapRenderSpace.world);
      case ScreenScale():
        paintAll(command.commands, space: MapRenderSpace.screen);
      case Transform():
        _paintTransform(command, space: space);
      case DrawCircle():
        if (space == layer) _paintCircle(command, space);
      case DrawPath():
        if (space == layer) _paintPath(command, space);
    }
  }

  /// Facteur qui convertit une dimension en pixels vers des unités monde.
  double _pxToWorld(DrawUnit unit, MapRenderSpace space) {
    if (unit == DrawUnit.world) return 1.0;
    return switch (space) {
      MapRenderSpace.screen => 1 / zoomScale,
      MapRenderSpace.world => 1 / referenceZoomScale,
    };
  }

  void _paintCircle(DrawCircle c, MapRenderSpace space) {
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

  void _paintPath(DrawPath c, MapRenderSpace space) {
    final k = _pxToWorld(c.unit, space);
    final p = c.paint;

    if (k != 1.0 && p.style == PaintingStyle.stroke && p.strokeWidth != 0.0) {
      canvas.drawPath(c.path, Paint.from(p)..strokeWidth = p.strokeWidth * k);
    } else {
      canvas.drawPath(c.path, p);
    }
  }

  void _paintTransform(Transform command, {required MapRenderSpace space}) {
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
