import 'dart:ui';
import 'package:map_canvas/domain/domain.dart';
import 'package:map_engine/map_engine.dart';

enum MapRenderSpace { world, screen }

final class MapCommandRenderer {
  const MapCommandRenderer({required this.canvas, this.camera});

  final Canvas canvas;
  final MapCameraReader? camera;

  double get _scale => camera?.zoomScale ?? 1.0;

  void paintAll(
    Iterable<MapDrawCommand> commands, {
    MapRenderSpace space = MapRenderSpace.world,
  }) {
    for (final command in commands) {
      paint(command, space: space);
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
        _paintCircle(command, space: space);

      case DrawPath():
        _paintPath(command, space: space);
    }
  }

  void _paintCircle(DrawCircle command, {required MapRenderSpace space}) {
    if (space == MapRenderSpace.world || camera == null) {
      canvas.drawCircle(command.center.value, command.radius, command.paint);
      return;
    }

    canvas.save();

    canvas.translate(command.center.value.dx, command.center.value.dy);

    // La caméra applique ensuite `scale`.
    // On l'annule pour conserver un rayon constant à l'écran.
    canvas.scale(1 / _scale);

    canvas.drawCircle(Offset.zero, command.radius, command.paint);

    canvas.restore();
  }

  void _paintPath(DrawPath command, {required MapRenderSpace space}) {
    if (space == MapRenderSpace.world || camera == null) {
      canvas.drawPath(command.path, command.paint);
      return;
    }

    final paint = command.paint;

    if (paint.style == PaintingStyle.stroke && paint.strokeWidth != 0.0) {
      final screenPaint = Paint.from(paint)
        ..strokeWidth = paint.strokeWidth / _scale;

      canvas.drawPath(command.path, screenPaint);
      return;
    }

    canvas.drawPath(command.path, paint);
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

    // Le Transform ne change pas le scope.
    // Ses enfants héritent simplement de World ou Screen.
    paintAll(command.commands, space: space);

    canvas.restore();
  }

  void applyCameraTransform() {
    final camera = this.camera;

    if (camera == null) {
      return;
    }

    canvas.transform(buildCameraTransform(camera).storage);
  }
}
