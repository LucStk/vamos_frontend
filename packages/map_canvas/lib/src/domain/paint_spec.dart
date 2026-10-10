// paint_spec.dart
import 'dart:ui';
import 'length.dart';

// paint_spec.dart
sealed class PaintSpec {
  const PaintSpec(this.color);
  final Color color;
  bool get dependsOnZoom;
}

final class Fill extends PaintSpec {
  const Fill(super.color);
  @override
  bool get dependsOnZoom => false;
}

final class Stroke extends PaintSpec {
  const Stroke(
    super.color, {
    required this.width,
    this.dash,
    this.cap = StrokeCap.butt,
    this.join = StrokeJoin.miter,
  });

  final Length width;
  final List<Length>? dash;
  final StrokeCap cap;
  final StrokeJoin join;

  @override
  bool get dependsOnZoom =>
      width.dependsOnZoom || (dash?.any((d) => d.dependsOnZoom) ?? false);
}
