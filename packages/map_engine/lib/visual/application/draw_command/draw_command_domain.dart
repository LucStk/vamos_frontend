import 'dart:ui';

import 'package:map_engine/map_engine.dart';

sealed class MapDrawCommand {
  const MapDrawCommand();
}

final class WorldScale extends MapDrawCommand {
  const WorldScale(this.commands);

  final List<MapDrawCommand> commands;
}

final class ScreenScale extends MapDrawCommand {
  const ScreenScale(this.commands);

  final List<MapDrawCommand> commands;
}

final class DrawCircle extends MapDrawCommand {
  const DrawCircle({
    required this.center,
    required this.radius,
    required this.paint,
  });

  final WorldOffset center;
  final double radius;
  final Paint paint;
}

final class DrawPath extends MapDrawCommand {
  const DrawPath({required this.path, required this.paint});

  final Path path;
  final Paint paint;
}

final class Transform extends MapDrawCommand {
  const Transform({required this.transform, required this.commands});

  final DrawTransformData transform;
  final List<MapDrawCommand> commands;
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
