import 'dart:ui';

abstract class MapDrawCommand {
  const MapDrawCommand({this.transform = const DrawTransform()});

  final DrawTransform transform;
}

final class DrawTransform {
  const DrawTransform({
    this.scale = 1.0,
    this.translation = Offset.zero,
    this.rotation = 0.0,
  });

  final double scale;
  final Offset translation;
  final double rotation;
}

final class DrawCircle extends MapDrawCommand {
  const DrawCircle({
    required this.center,
    required this.radius,
    required this.paint,
    super.transform,
  });

  final Offset center;
  final double radius;
  final Paint paint;
}

final class DrawPath extends MapDrawCommand {
  const DrawPath({required this.path, required this.paint, super.transform});

  final Path path;
  final Paint paint;
}
