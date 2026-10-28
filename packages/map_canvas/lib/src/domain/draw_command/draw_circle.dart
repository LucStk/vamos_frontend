part of 'draw_command.dart';

final class DrawCircle extends DrawCommand {
  const DrawCircle({
    required this.center,
    required this.radius,
    required this.style,
  });
  final WorldOffset center;
  final Length radius;
  final PaintSpec style;

  @override
  bool get dependsOnZoom => radius.dependsOnZoom || style.dependsOnZoom;
}
