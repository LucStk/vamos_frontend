import 'dart:ui';
import 'package:map_canvas/domain/domain.dart';

enum MapRenderSpace { world, screen }

final class MapCommandRenderer {
  const MapCommandRenderer({
    required this.canvas,
    required this.layer,
    this.zoomScale = 1.0,
  });

  final Canvas canvas;
  final MapRenderSpace layer; // couche en cours de rendu
  final double zoomScale;

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

  void _paintCircle(DrawCircle c, MapRenderSpace space) {
    if (space == MapRenderSpace.world) {
      canvas.drawCircle(c.center.value, c.radius, c.paint);
      return;
    }
    canvas.save();
    canvas.translate(c.center.value.dx, c.center.value.dy);
    canvas.scale(1 / zoomScale); // annule le scale du Transform
    canvas.drawCircle(Offset.zero, c.radius, c.paint);
    canvas.restore();
  }

  void _paintPath(DrawPath c, MapRenderSpace space) {
    if (space == MapRenderSpace.world) {
      canvas.drawPath(c.path, c.paint);
      return;
    }
    final p = c.paint;
    if (p.style == PaintingStyle.stroke && p.strokeWidth != 0.0) {
      canvas.drawPath(
        c.path,
        Paint.from(p)..strokeWidth = p.strokeWidth / zoomScale,
      );
    } else {
      canvas.drawPath(c.path, p);
    }
  }

  // _paintTransform : inchangé
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

    // Le Transform ne change pas le scope.
    // Ses enfants héritent simplement de World ou Screen.
    paintAll(command.commands, space: space);

    canvas.restore();
  }

  // void applyCameraTransform() {
  //   final camera = this.camera;

  //   if (camera == null) {
  //     return;
  //   }

  //   canvas.transform(buildCameraTransform(camera).storage);
  // }
}
