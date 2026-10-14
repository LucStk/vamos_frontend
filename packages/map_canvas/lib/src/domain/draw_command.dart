import 'dart:ui';
import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/src/domain/length.dart';
import 'package:map_canvas/src/domain/paint_spec.dart';

sealed class DrawCommand {
  const DrawCommand();
}

final class DrawTransform extends DrawCommand {
  const DrawTransform({required this.transform, required this.commands});
  final DrawTransformData transform;
  final List<DrawCommand> commands;
}

final class DrawGroup extends DrawCommand {
  const DrawGroup(this.commands);
  final List<DrawCommand> commands;
}

final class DrawTransformData {
  const DrawTransformData({
    this.scale = 1.0,
    this.translation = LengthOffset.zero,
    this.rotation = 0.0,
    this.origin = const WorldOffset(Offset.zero),
  });

  final double scale; // sans dimension
  final LengthOffset translation;
  final double rotation; // sans dimension
  final WorldOffset origin;
}

// --- Feuilles ---

final class DrawCircle extends DrawCommand {
  const DrawCircle({
    required this.center,
    required this.radius,
    required this.style,
  });
  final WorldOffset center;
  final Length radius;
  final PaintSpec style;
  bool get dependsOnZoom => radius.dependsOnZoom || style.dependsOnZoom;
}

final class DrawPath extends DrawCommand {
  const DrawPath({required this.path, required this.style});
  final Path path;
  final PaintSpec style;
  bool get dependsOnZoom => style.dependsOnZoom;
}
