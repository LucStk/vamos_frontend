import 'dart:ui';

abstract class MapDrawCommand {
  const MapDrawCommand();
}

final class DrawTransform extends MapDrawCommand {
  const DrawTransform({required this.transform, required this.commands});
  final DrawTransformData transform;
  final List<MapDrawCommand> commands;
}

final class DrawTransformData {
  const DrawTransformData({
    this.scale = 1.0,
    this.translation = Offset.zero,
    this.rotation = 0.0,
    this.origin = Offset.zero,
  });
  final double scale;
  final Offset translation;
  final double rotation;
  final Offset origin;
}

final class DrawCircle extends MapDrawCommand {
  const DrawCircle({
    required this.center,
    required this.radius,
    required this.paint,
  });
  final Offset center;
  final double radius;
  final Paint paint;
}

final class DrawPath extends MapDrawCommand {
  const DrawPath({required this.path, required this.paint});
  final Path path;
  final Paint paint;
}
