import 'dart:ui';

import 'package:map_engine/visual/visual.dart';

final class MapDrawCommandPainter {
  static void paint(Canvas canvas, MapDrawCommand command) {
    switch (command) {
      case DrawTransform():
        _paintTransform(canvas, command);
      case DrawCircle():
        _paintCircle(canvas, command);
      case DrawPath():
        _paintPath(canvas, command);
    }
  }

  static void paintAll(Canvas canvas, Iterable<MapDrawCommand> commands) {
    for (final command in commands) {
      paint(canvas, command);
    }
  }

  static void _paintTransform(Canvas canvas, DrawTransform command) {
    canvas.save();
    _applyTransform(canvas, command.transform);
    paintAll(canvas, command.commands);
    canvas.restore();
  }

  static void _paintCircle(Canvas canvas, DrawCircle command) {
    canvas.drawCircle(command.center.value, command.radius, command.paint);
  }

  static void _paintPath(Canvas canvas, DrawPath command) {
    canvas.drawPath(command.path, command.paint);
  }

  static void _applyTransform(Canvas canvas, DrawTransformData transform) {
    canvas.translate(transform.origin.dx, transform.origin.dy);
    if (transform.rotation != 0.0) {
      canvas.rotate(transform.rotation);
    }
    if (transform.scale != 1.0) {
      canvas.scale(transform.scale);
    }
    canvas.translate(-transform.origin.dx, -transform.origin.dy);
    if (transform.translation != Offset.zero) {
      canvas.translate(transform.translation.dx, transform.translation.dy);
    }
  }
}
