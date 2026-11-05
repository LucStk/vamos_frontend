// paint_spec.dart
import 'dart:ui';
import 'package:map_canvas/src/domain/icon/icon_glyph.dart';

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

PaintSpec glyphStyle(IconGlyph g, Color color, {required double sizePx}) =>
    switch (g.paint) {
      GlyphFill() => Fill(color),
      GlyphStroke(:final width) => Stroke(
        color,
        width: (width * sizePx / g.viewBox.width).px,
        cap: StrokeCap.round,
        join: StrokeJoin.round,
      ),
    };
