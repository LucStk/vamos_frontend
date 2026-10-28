part of 'draw_command.dart';

final class DrawPath extends DrawCommand {
  const DrawPath({required this.path, required this.style});
  final Path path;
  final PaintSpec style;
  bool get dependsOnZoom => style.dependsOnZoom;
}

final class DrawAnchoredPath extends DrawCommand {
  const DrawAnchoredPath({
    required this.anchor,
    required this.path,
    required this.style,
  });

  final WorldOffset anchor;
  final Path path; // coordonnées en px, (0,0) = anchor, y vers le bas
  final PaintSpec style;

  @override
  bool get dependsOnZoom => true;
}
