import 'dart:ui';
import 'package:map_engine/map_engine.dart';
import 'draw_space.dart';

sealed class DrawCommand {
  const DrawCommand();
}

final class DrawGroup extends DrawCommand {
  const DrawGroup(this.commands, {this.space});
  final DrawSpace? space;
  final List<DrawCommand> commands;
}

final class DrawCircle extends DrawCommand {
  const DrawCircle({
    required this.center,
    required this.radius,
    required this.paint,
  });

  final WorldOffset center;
  final double radius;
  final Paint paint;
}

final class DrawPath extends DrawCommand {
  const DrawPath({required this.path, required this.paint, this.dash});
  final List<double>? dash;
  final Path path;
  final Paint paint;
}

final class DrawTransform extends DrawCommand {
  const DrawTransform({required this.transform, required this.commands});

  final DrawTransformData transform;
  final List<DrawCommand> commands;
}

final class DrawTransformData {
  const DrawTransformData({
    this.scale = 1.0,
    this.translation = Offset.zero,
    this.rotation = 0.0,
    this.origin = const WorldOffset(Offset.zero),
  });

  final double scale;
  final Offset translation;
  final double rotation;
  final WorldOffset origin;
}
